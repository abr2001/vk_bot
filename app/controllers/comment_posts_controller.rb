# frozen_string_literal: true

class CommentPostsController < ApplicationController
  before_action :set_comment_post, only: %i[show edit update destroy bot]

  respond_to :html

  def index
    @comment_posts = CommentPost.where(user: current_user).order(id: :desc)
    respond_with(@comment_posts)
  end

  def show
    respond_with(@comment_post)
  end

  def new
    @comment_post = CommentPost.new
    respond_with(@comment_post)
  end

  def edit; end

  def create
    @comment_post = CommentPost.new(comment_post_params)
    @comment_post.save
    redirect_to comment_posts_path, notice: "Ссылка на пост добавлена #{@comment_post.link}"
  end

  def update
    @comment_post.update(comment_post_params)
    respond_with(@comment_post)
  end

  def destroy
    @comment_post.destroy
    respond_with(@comment_post)
  end

  def bot
    VkCreateCommentForPost.perform_later(
      owner_id: @comment_post.owner_id,
      post_id: @comment_post.post_id
    )

    redirect_to comment_posts_path, notice: "Комментарий отправлен для #{@comment_post.link}"
  end

  private

  def set_comment_post
    @comment_post = CommentPost.find(params[:id])
  end

  def comment_post_params
    { owner_id: owner_id, post_id: post_id, user: current_user }
  end

  def post_id
    link.split('_').second
  end

  def owner_id
    link.split('_').first.split('wall').second
  end

  def link
    @link ||= params[:link]
  end
end
