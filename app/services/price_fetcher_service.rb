# frozen_string_literal: true
require 'net/http'

class PriceFetcherService
  attr_accessor :success, :response, :error

  BASE_URL = "https://pricing.us-east-1.amazonaws.com/"
  VERSION = 'v1.0'

  def initialize(offer_name)
    @url = "#{BASE_URL}offers/#{VERSION}/aws/#{offer_name}/current/index.json"
    @success = false
  end

  def call
    @response = Net::HTTP.get_response(URI(@url))
    @success = true if @response.is_a?(Net::HTTPSuccess)
    
    self
  end
end
