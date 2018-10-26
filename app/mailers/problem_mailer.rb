# frozen_string_literal: true

# Main mailer
class ProblemMailer < ApplicationMailer
  # default from: 'vanhoz507@gmail.com'

  def problem_email
    @time = params[:time]
    @url = params[:url]
    mail(
      to: params[:email],
      subject: 'Service response code is invalid'
    )
  end

  def recovered_email
    @url = params[:url]
    mail(to: params[:email], subject: 'Service is avaliable again')
  end
end
