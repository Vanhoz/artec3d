# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProblemMailer, type: :mailer do
  describe 'problem_email' do
    let(:mail) do
      described_class.with(
        url: ENV['SERVICE_URL'],
        time: 3,
        email: 'vanhozzohan@yandex.ru'
      ).problem_email.deliver_now
    end

    it 'renders the subject' do
      expect(mail.subject).to eq('Service response code is invalid')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['vanhozzohan@yandex.ru'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'assigns @url' do
      expect(mail.body.encoded).to match(ENV['SERVICE_URL'])
    end

    it 'assigns @time' do
      expect(mail.body.encoded)
        .to match(/3/)
    end
  end

  describe 'recovered_email' do
    let(:mail) do
      described_class.with(
        url: ENV['SERVICE_URL'],
        email: 'vanhozzohan@yandex.ru'
      ).recovered_email.deliver_now
    end

    it 'renders the subject' do
      expect(mail.subject).to eq('Service is avaliable again')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['vanhozzohan@yandex.ru'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'assigns @url' do
      expect(mail.body.encoded).to match(ENV['SERVICE_URL'])
    end
  end
end
