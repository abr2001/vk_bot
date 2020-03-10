# frozen_string_literal: true

class PostGroupsController < ApplicationController
  before_action :set_post_group, only: %i[edit update destroy]

  respond_to :html

  def index
    @post_groups = PostGroup.all
    respond_with(@post_groups)
  end

  def show
    redirect_to post_groups_path
  end

  def new
    @post_group = PostGroup.new
    respond_with(@post_group)
  end

  def edit; end

  def create
    @post_group = PostGroup.new(post_group_params)
    @post_group.save
    respond_with(@post_group)
  end

  def update
    @post_group.update(post_group_params)
    respond_with(@post_group)
  end

  def destroy
    @post_group.destroy
    respond_with(@post_group)
  end

  def select
    @post_groups = PostGroup.all.map { |group| group.attributes.merge(checked: checked(group)) }
  end

  private

  def set_post_group
    @post_group = PostGroup.find(params[:id])
  end

  def post_group_params
    params.require(:post_group).permit(:name)
  end

  def checked(group)
    account.auto_post_groups.nil? ? false : account.auto_post_groups.include?(group.id.to_s)
  end

  def account
    @account ||= Account.find(params[:account_id])
  end
end
