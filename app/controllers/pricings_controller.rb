class PricingsController < ApplicationController
  def index
    offer = Offer.find_by(code: params[:offer_code])
    region = Region.find_by(code: params[:region_code])

    if offer.present? && region.present?
      render json: Pricing.for(offer.code, region.id)
    else
      render json: {
        error: "We could not find AWS pricing for your query."
      }, status: :not_found
    end
  end
end
