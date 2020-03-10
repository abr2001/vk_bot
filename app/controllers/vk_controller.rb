# frozen_string_literal: true

class VkController < ApplicationController
  before_action :set_account, except: %i[auth_vk error_api_log comments_log]
  before_action :only_owner, except: %i[auth_vk test_vk error_api_log comments_log]

  def auth_vk
    @result = Vkontakte::AuthService.new(params: params, current_user: current_user).auth_vk
  end

  def actions
    result = Vkontakte::FriendsService.new(account: @account).users_get

    if result[:success]
      @vk_user = result[:response].response.first
    else
      redirect_to accounts_path, notice: "Токен ВК для #{@account.name} не действителен"
    end
  end

  def test_vk
    response = Vkontakte::FriendsService.new(account: @account).users_get
    ip = Vkontakte::ApiService.new(account: @account).my_ip.ip

    redirect_to(
      accounts_path,
      notice: response[:success] ? "Тест пройден. Ваш IP: #{ip}" : 'Тест не пройден'
    )
  end

  def add_friends_get
    count = Vkontakte::FriendsService.new(params: params, account: @account).friends_get

    redirect_to(
      account_actions_path(@account),
      notice: "Добавили в очередь на заявки в друзья - #{count} заявок"
    )
  end

  def add_friends_from_file
    count = Vkontakte::FriendsService.new(params: params, account: @account).friends_from_file

    redirect_to(
      account_actions_path(@account),
      notice: "Добавили в очередь на заявки в друзья - #{count} заявок"
    )
  end

  def error_api_log
    only_admin!

    @logs = ApiVkErrorLog
      .includes(:account)
      .order(created_at: :desc)
      .paginate(page: params[:page], per_page: 25)
  end

  def comments_log; end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end

  def only_owner
    head :forbidden unless @account.user == current_user
  end
end
