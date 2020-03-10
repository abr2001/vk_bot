# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :only_admin!
  before_action :load_user, only: %i[list_accounts edit update]

  def index
    @users = User.all
  end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to edit_user_path(@user), notice: 'Настройки сохранены'
  end

  def list_accounts
    @accounts = @user.accounts
  end

  private

  def load_user
    @user = User.find(params[:id] || params[:user_id])
  end

  def user_params
    params.require(:user).permit(:rucaptcha_key)
  end
end
