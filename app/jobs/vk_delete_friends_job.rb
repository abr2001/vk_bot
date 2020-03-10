# frozen_string_literal: true

class VkDeleteFriendsJob < ApplicationJob
  def perform
    Vkontakte::FriendsService.new.delete_friends
  rescue StandardError => e
    create_logger(e)
  end
end
