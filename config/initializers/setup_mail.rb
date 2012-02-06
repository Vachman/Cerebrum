ActionMailer::Base.smtp_settings = {
  :address              => "mail.obltelecom.ru",
  :port                 => "25",
  :domain               => "localhost:3000",
  :user_name            => "cerebrum@obltelecom.ru",
  :password             => "cerebrpass",
  :authentication       => "plain",
  :enable_starttls_auto => false
}

