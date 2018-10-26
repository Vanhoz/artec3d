# frozen_string_literal: true

# Worker for sending email when there are problems
class SendProblemEmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(time, email)
    service = ENV['SERVICE_URL']
    return unless [3, 10, 50, 100, 500].include? time

    ProblemMailer.with(url: service, time: time, email: email)
                 .problem_email
                 .deliver_later
  end
end
