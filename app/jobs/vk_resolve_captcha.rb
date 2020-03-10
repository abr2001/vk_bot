# frozen_string_literal: true

class VkResolveCaptchaJob < ApplicationJob
  def perform
    Vkontakte::CaptchaService.new.resolve_captcha
  rescue StandardError => e
    create_logger(e)
  end
end
