class Pricing < ApplicationRecord
  belongs_to :product

  def self.for(offer_code, region_id)
    joins([product: :offer]).where("offers.code = ? && products.region_id = ?", offer_code, region_id)
  end

  def as_json(options = {})
    {
      description: description,
      beginRange: begin_range,
      endRange: end_range,
      unit: unit,
      pricePerUnit: price_per_unit,
      effectiveDate: effective_date
    }
  end
end
