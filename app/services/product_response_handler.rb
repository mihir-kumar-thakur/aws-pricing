# frozen_string_literal: true

class ProductResponseHandler
  attr_accessor :success, :products

  def initialize(products = {}, offer_name)
    @offer_id = Offer.find_by_code(offer_name).id
    @products = products
  end

  def call
    products.values.each do |value|
      product = Product.find_or_create_by(sku: value[:sku])
      product.family = value[:productFamily]
      product.location = value[:attributes][:location]
      product.properties = value[:attributes]
      product.region = Region.find_by_name(value[:attributes][:location])
      product.offer_id = @offer_id

      product.save!
    end
  end
end

