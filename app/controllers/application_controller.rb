# frozen_string_literal: true

require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :authenticate_user!

  protect_from_forgery with: :exception
  layout(proc { |c| c.request.xhr? ? false : 'application' })

  private

  def only_admin!
    head :forbidden unless current_user.admin?
  end
end
