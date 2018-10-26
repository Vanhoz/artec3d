# frozen_string_literal: true

require 'sidekiq/api'
namespace :start do
  desc 'start the rumble'
  task :first_try, [:email] => [:environment] do |_task, args|
    SendRequestWorker.perform_async(0, args[:email])
  end
end
