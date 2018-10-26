# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'

describe SendProblemEmailWorker do
  it 'enqueue a job' do
    expect {
      SendProblemEmailWorker.perform_async(0, 'example@email.com')
    }.to change(SendProblemEmailWorker.jobs, :size).by 1
  end
end
