# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update commenter]

  respond_to :html

  def index
    @accounts = current_user.accounts
    respond_with(@accounts)
  end

  def show
    respond_with(@account)
  end

  def new
    @account = Account.new
    respond_with(@account)
  end

  def edit; end

  def create
    @account = Account.new(account_params)
    @account.save!
    respond_with(@account)
  end

  def update
    @account.update!(account_params)
    redirect_to accounts_path
  end

  def destroy
    DeleteAccountJob.perform_later(params[:id])

    redirect_to(
      accounts_path,
      notice: 'Задача на полное удаление отправлено на сервер, обновите страницу позднее'
    )
  end

  def commenter
    @account.commenter = params[:checked]
    @account.save!
    render json: { status: :ok }, status: :ok
  end

  private

  def set_account
    head :forbidden unless Account.where(id: params[:id]).exists?

    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account)
      .permit(:name, :token, :user, :provider, :code,
              :comment, :proxy_ip, :proxy_port, :proxy_user, :proxy_password,
              auto_post_groups: [])
  end
end
