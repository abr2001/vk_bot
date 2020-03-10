# frozen_string_literal: true

class VkPostJob < ApplicationJob
  def perform
    Vkontakte::WallService.new.wall_post
  rescue StandardError => e
    create_logger(e)
  end
end
