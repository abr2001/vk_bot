# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_post_group, only: %i[index new create from_file to_file]

  respond_to :html

  def index
    @posts = @post_group.posts
    respond_with(@posts)
  end

  def show
    redirect_to post_group_posts_path(@post.post_group)
  end

  def new
    @post = @post_group.posts.new
    respond_with(@post)
  end

  def edit; end

  def create
    @post = @post_group.posts.create(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    redirect_to post_group_posts_path(@post.post_group)
  end

  def from_file
    PostService.new(params: params, post_group: @post_group).from_file
    redirect_to post_group_posts_path(@post_group)
  end

  def to_file
    file = PostService.new(post_group: @post_group).to_file
    send_data file, filename: "#{@post_group.name}.txt"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_group
    @post_group = in_group? ? PostGroup.find(group_id) : @post.post_group
  end

  def post_params
    params.require(:post).permit(:body, :post_group_id)
  end

  def in_group?
    group_id.present?
  end

  def group_id
    params[:post_group_id]
  end
end
