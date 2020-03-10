# frozen_string_literal: true

class VkCommentJob < ApplicationJob
  def perform
    Vkontakte::Comments::BaseService.new.run_bot
  rescue StandardError => e
    create_logger(e)
  end
end
