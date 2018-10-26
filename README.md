# Artec3D test app

Small guide to deploy the app.

You need to have redis installed due to sidekiq usage.

## Getting started

* Run `bundle install` to install gems and dependencies

* Create the database: `rails db:create`, adapter: postgres

* In root create file .env, where should be 3 environmental variables:
  `GMAIL_USERNAME` for your Gmail account username;
  `GMAIL_PASSWORD` for your Gmail account password;
  `SERVICE_URL` for the service you actually want to monitor.

* To start monitoring:
  First, run sidekiq server: `bundle exec sidekiq`
  Run task `rake start:first_try['your_email']`, where 'your email' is email you want to send messages to.

* Run tests: `bundle exec rspec`