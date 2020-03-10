# frozen_string_literal: true

class HomeController < ApplicationController
  def help; end

  def front; end

  def my_ip
    Vkontakte::ApiService.new.my_ip
  end
end
