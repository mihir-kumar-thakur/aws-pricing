# frozen_string_literal: true

class OfferResponseHandler
  attr_accessor :response, :version_changed
  
  def initialize(response = {})
    @response = response
    @version_changed = false
  end

  def call
    @offer = Offer.find_or_create_by(code: @response[:offerCode])
    @version_changed = @offer.version != @response[:version]

    @offer.version = @response[:version]
    @offer.publication_date = @response[:publicationDate]
    @offer.save!

    self
  end
end
