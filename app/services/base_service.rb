# frozen_string_literal: true

class BaseService
  attr_reader :errors
  include Rails.application.routes.url_helpers

  def initialize(opts = {})
    @errors = []
    opts.each do |name, value|
      instance_variable_set("@#{name}", value)
      self.class.send(:attr_reader, name)
    end
  end

  def main_app
    Rails.application.routes.url_helpers
  end
end
