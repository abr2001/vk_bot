Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 5
end

schedule_file = "config/schedule.yml"

if File.exists?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end

Sidekiq.options[:poll_interval] = 10
