# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  queue_as :default

  private

  def create_logger(e)
    logfile = File.open("#{Rails.root}/log/#{self.class.name.underscore}.log", 'a')
    logfile.sync = true
    logger = Logger.new(logfile)
    logger.error(inspect: e.inspect, backtrace: e.backtrace.inspect)
  end
end
