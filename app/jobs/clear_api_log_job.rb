# frozen_string_literal: true

class ClearApiLogJob < ApplicationJob
  def perform
    ApiVkErrorLog.where('created_at < ?', Date.current - 7.days).delete_all
  rescue StandardError => e
    create_logger(e)
  end
end
