# frozen_string_literal: true

class VkCreateCommentForPost < ApplicationJob
  def perform(post_id:, owner_id:)
    Vkontakte::Comments::DirectPostService.new(
      post_id: post_id,
      owner_id: owner_id
    ).create_comment_for_post
  rescue StandardError => e
    create_logger(e)
  end
end
