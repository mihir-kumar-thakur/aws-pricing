class PricingsController < ApplicationController
  def index
    offer = Offer.find_by(code: params[:offer_code])
    region = Region.find_by(code: params[:region_code])

    raise ActiveRecord::RecordNotFound unless offer.present? && region.present?
    
    render json: Pricing.for(offer.code, region.id, params[:date])
  end
end
