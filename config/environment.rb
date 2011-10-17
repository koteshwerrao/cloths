# Load the rails application
require File.expand_path('../application', __FILE__)
ActionMailer::Base.smtp_settings = {
    :tls => true,
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "gmail.com",
    :authentication => :plain,
    :user_name => "mymail@gmail.com",
    :password => "mypassword"
  }


ENV['RECAPTCHA_PUBLIC_KEY'] = '6LdYyccSAAAAAOa4R8dNNA2naR5myA9OYRSiYBw6'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6LdYyccSAAAAAPOU1NKkgYrLggGbv47DPb91lE1f'
# Initialize the rails application
Cloth::Application.initialize!
