# frozen_string_literal: true

class Api::V1::CommentsController < ApplicationController
  def log
    render json: log_json, status: :ok
  end

  private

  def log_json
    {
      logs: Vkontakte::Comments::LogService.new(params: params).get,
      count: CommentLog.count
    }
  end
end
