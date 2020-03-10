# frozen_string_literal: true

class PostService < BaseService
  def from_file
    Post.transaction do
      post_group.posts.destroy_all
      posts_from_file.each do |text|
        Post.create!(body: text, post_group: post_group)
      end
    end
  end

  def to_file
    text = ''
    post_group.posts.each do |post|
      text += "#{post.body}\r\n#{separator}\r\n"
    end
    text
  end

  def next_post
    return unless post_group.posts.exists?

    return create_last_post if last_post.nil?

    last_post.update!(post: find_next_post)
    find_next_post
  end

  private

  def find_next_post
    @find_next_post ||= post_group.posts
      .where(post_group: post_group)
      .where('id > ?', last_post.post.id).first || post_group.posts.first
  end

  def last_post
    @last_post ||= account.last_posts.where(post_group: post_group).first
  end

  def create_last_post
    LastPost.create!(post_group: post_group, post: post_group.posts.first, account: account)
    post_group.posts.first
  end

  def file
    @file ||= params[:datafile].read
  end

  def posts_from_file
    @posts_from_file ||= file.split(separator).map { |text| prepare_text(text) }.reject(&:blank?)
  end

  def separator
    @separator ||= '*' * 20
  end

  def prepare_text(text)
    text.delete!('*', '')
  end
end
