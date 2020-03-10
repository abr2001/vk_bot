# frozen_string_literal: true

class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_post_group, only: [:index]

  respond_to :json

  def index
    posts = Post.where(post_group: @post_group)
    respond_with(posts)
  end

  private

  def set_post_group
    @post_group = PostGroup.find(params[:post_group_id])
  end
end
