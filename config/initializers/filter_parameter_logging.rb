# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:password, :token, :rucaptcha_key, :vk_app_secret, :proxy_password]