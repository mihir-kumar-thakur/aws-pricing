class Product < ApplicationRecord
  belongs_to :offer
  belongs_to :region, optional: true

  has_many :pricings
end
