class TermsResponseHandler
  def initialize(terms = {})
    @terms = terms
  end

  def call
    @terms[:OnDemand].values.each do |ondemand_terms|
      ondemand_terms.values.each do |ondemand_term|
        price_dimensions = ondemand_term[:priceDimensions].values.first
        pricing = Pricing.new
        pricing.sku = ondemand_term[:sku]
        pricing.effective_date = ondemand_term[:effectiveDate]
        pricing.rate_code = price_dimensions[:rateCode]
        pricing.description = price_dimensions[:description]
        pricing.begin_range = price_dimensions[:beginRange]
        pricing.end_range = price_dimensions[:endRange]
        pricing.unit = price_dimensions[:unit]
        pricing.currency = price_dimensions[:pricePerUnit].keys.first.to_s
        pricing.price_per_unit = price_dimensions[:pricePerUnit].values.first
        pricing.product = Product.find_by_sku(ondemand_term[:sku])

        pricing.save!
      end
    end
  end
end
