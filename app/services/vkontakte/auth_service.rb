# frozen_string_literal: true

class Vkontakte::AuthService < Vkontakte::ApiService
  def auth_vk
    return login_error if login?

    page = authcheck_code? ? code_form_submit : code_form.submit

    return code_error if login_page?(page)

    account = init_account(page)
    return account_error(account) unless account.save

    hash(error: false, success: true, accounts: accounts)
  end

  private

  def code_form_submit
    code_form.code = params[:code]
    code_form.submit
  end

  def init_account(page)
    account = Account.find_by(name: params[:email], user: current_user)

    if account.present?
      account.token = parse_page(page, 0)
      account
    else
      new_account(page)
    end
  end

  def new_account(page)
    Account.new(
      name: params[:email],
      token: parse_page(page, 0),
      code: parse_page(page, 2),
      provider: Account::PROVIDER[:vk],
      user: current_user
    )
  end

  def url
    # rubocop:disable Metrics/LineLength: Line is too long
    "https://oauth.vk.com/authorize?client_id=#{params[:vk_app_id]}&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=offline,friends,wall&response_type=token&v=#{vk_version_api}&revoke=1"
    # rubocop:enable Metrics/LineLength: Line is too long
  end

  def vk_version_api
    ENV['VK_VERSION_API']
  end

  def parse_page(page, position)
    page.uri.to_s.split('&')[position].split('=')[1]
  end

  def action
    @action ||= code_form.action.split('&')[0].split('=')[1]
  end

  def login?
    action.eql?('login')
  end

  def authcheck_code?
    action.eql?('authcheck_code')
  end

  def login_page?(page)
    page.uri.to_s.split('/')[3].split('?')[0] == 'login'
  end

  def code_form
    @code_form ||=
      begin
        form = Mechanize.new.get(url).form
        form.email = params[:email]
        form.pass = params[:password]
        page = form.submit
        page.form
      end
  end

  def login_error
    hash(error: 'Неверный логин или пароль', success: false)
  end

  def code_error
    hash(error: 'Неверный код', success: false)
  end

  def account_error(account)
    hash(error: account.errors.messages[:base][0], success: false)
  end

  def accounts
    @accounts ||= Account.where(user_id: current_user)
  end
end
