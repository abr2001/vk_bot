# frozen_string_literal: true

class VkJob < ApplicationJob
  def perform
    Vkontakte::FriendsService.new.add_friends
  rescue StandardError => e
    create_logger(e)
  end
end
