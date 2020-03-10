# frozen_string_literal: true

class Api::V1::PublicController < ApplicationController
  skip_before_action :authenticate_user!

  def my_ip
    render json: { ip: request.remote_ip }, status: :ok
  end
end
