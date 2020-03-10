# frozen_string_literal: true

class TailsController < ApplicationController
  before_action :set_tail, only: %i[show edit update destroy]
  before_action :set_account, only: [:index]

  respond_to :html

  def index
    @tails = @account
      .tails
      .sended
      .order(updated_at: :desc)
      .paginate(page: params[:page], per_page: 25)

    respond_with(@tails)
  end

  def show
    respond_with(@tail)
  end

  def new
    @tail = Tail.new
    respond_with(@tail)
  end

  def edit; end

  def create
    @tail = Tail.new(tail_params)
    @tail.save
    respond_with(@tail)
  end

  def update
    @tail.update(tail_params)
    respond_with(@tail)
  end

  def destroy
    @tail.destroy
    respond_with(@tail)
  end

  def clear_all
    ClearTilesJob.perform_later(params[:account_id])

    redirect_to(
      accounts_path,
      notice: 'Задача на очистку отправлена на сервер, обновите страницу для обновления статистики'
    )
  end

  private

  def set_tail
    @tail = Tail.find(params[:id])
  end

  def set_account
    head :forbidden unless Account.where(id: params[:account_id]).exists?
    @account = Account.find(params[:account_id])
    head :forbidden unless @account.user == current_user || current_user.admin
  end

  def tail_params
    params.require(:tail).permit(:status, :friend_id, :response)
  end
end
