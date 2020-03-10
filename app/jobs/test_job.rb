# frozen_string_literal: true

class TestJob
  include Sidekiq::Worker

  sidekiq_options lock: :while_executing, lock_timeout: 120, queue: 'default'

  def perform
    sleep 60
    puts 'Hello!'
  end
end
