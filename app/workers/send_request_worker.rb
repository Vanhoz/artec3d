# frozen_string_literal: true

# Worker for dealing with request
class SendRequestWorker
  include Sidekiq::Worker
  include CallApi
  sidekiq_options retry: false

  def perform(time, email)
    if make_response == 200
      if time != 0
        time = 0
        ProblemMailer.with(
          url: ENV['SERVICE_URL'],
          email: email
        ).recovered_email.deliver_later
      end
    else
      time += 1
      SendProblemEmailWorker.perform_async(time, email)
    end
    SendRequestWorker.perform_in(1.minute, time, email)
  end
end
