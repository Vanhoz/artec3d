# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'

describe SendRequestWorker do
  it 'enqueue a job' do
    expect {
      SendRequestWorker.perform_async(0, 'example@email.com')
    }.to change(SendRequestWorker.jobs, :size).by 1
  end
end
