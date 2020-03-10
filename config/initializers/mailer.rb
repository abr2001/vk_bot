Rails.application.configure do
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'smtp.gmail.com',
  user_name:            'vk.service.kolhoz@gmail.com',
  password:             'TIyrDLkP4X',
  authentication:       'plain',
  enable_starttls_auto: true}
end
