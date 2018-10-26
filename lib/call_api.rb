# frozen_string_literal: true

# Make call to service
module CallApi
  def make_response
    service = ENV['SERVICE_URL']
    result = RestClient.get(service) { |response, _request, _result| response }
    result.code
  end
end
