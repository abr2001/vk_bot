# frozen_string_literal: true

class CommentAccountsController < ApplicationController
  before_action :set_comment_account, only: %i[show edit update destroy]

  respond_to :html

  def index
    @comment_accounts = CommentAccount.all
    respond_with(@comment_accounts)
  end

  def show
    respond_with(@comment_account)
  end

  def new
    @comment_account = CommentAccount.new
    respond_with(@comment_account)
  end

  def edit; end

  def create
    @comment_account = CommentAccount.new(comment_account_params)
    @comment_account.save
    respond_with(@comment_account)
  end

  def update
    @comment_account.update(comment_account_params)
    respond_with(@comment_account)
  end

  def destroy
    @comment_account.destroy
    respond_with(@comment_account)
  end

  private

  def set_comment_account
    @comment_account = CommentAccount.find(params[:id])
  end

  def comment_account_params
    params.require(:comment_account).permit(:owner_id)
  end
end
