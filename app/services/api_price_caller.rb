# frozen_string_literal: true

class ApiPriceCaller
  attr_accessor :success, :errors

  def initialize(offer_name = 'AmazonCloudFront')
    @offer_name = offer_name
    @success = false
  end

  def call
    begin
      api_response = PriceFetcherService.new(@offer_name).call
      response = JSON.parse(api_response.response.body, symbolize_names: true)
      
      if api_response.success && OfferResponseHandler.new(response.except(:products, :terms)).call.version_changed
        ProductResponseHandler.new(response[:products], @offer_name).call
        TermsResponseHandler.new(response[:terms]).call
      end

      @success = true
      AUDIT_LOG.info("Fetching AWS pricing API success for offer #{@offer_name}")
    rescue StandardError => error
      @errors = error.to_s
      AUDIT_LOG.error("Fetching AWS pricing API failed for offer #{@offer_name}, message- #{@errors}, backtrace - #{error.backtrace.to_s}")
    end

    self
  end
end
