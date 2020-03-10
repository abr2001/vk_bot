# frozen_string_literal: true

class Vkontakte::CaptchaService < Vkontakte::ApiService
  LIMIT_BALANCE = 0.05

  def resolve_captcha
    total_balance = balance_rucaptcha(client)
    return if total_balance < LIMIT_BALANCE

    User.find_each do |user|
      user.accounts.each do |account|
        captcha_for_account(account)
      end
    end
  end

  def total_balance
    balance_rucaptcha(client)
  end

  def private_balance
    return 0 if current_user.rucaptcha_key.nil?

    balance_rucaptcha TwoCaptcha.new(current_user.rucaptcha_key)
  end

  def captcha_key(captcha_img)
    return if total_balance < LIMIT_BALANCE

    captcha = client.decode!(url: captcha_img)
    captcha.text
  end

  private

  def captcha_for_account(account)
    account.tails.captcha.each { |tail| add_friend_with_captcha(tail) }
  end

  def add_friend_with_captcha(tail)
    captcha = client.decode!(url: tail.captcha_img)

    response = api_get(
      'friends.add',
      account,
      user_id: tail.friend_id,
      follow: 1,
      captcha_sid: tail.captcha_sid,
      captcha_key: captcha.text
    )

    update_tail(tail, response)
  end

  def client
    @client ||= TwoCaptcha.new(ENV['RUCAPTCHA_KEY'])
  end

  def balance_rucaptcha(client_rucaptcha)
    client_rucaptcha.balance
  rescue StandardError
    0
  end

  def update_tail(tail, response)
    Tail.transaction do
      tail.update(status: 'DONE', response: response)
      tail.update(resolved_captcha: true) if response.error.nil?
      save_error(tail, response.error) unless response.error.nil?
    end
  end
end
