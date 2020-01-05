class Product < ApplicationRecord
  validates :sku, presence: true
  validates :sku, uniqueness: true

  belongs_to :offer
  belongs_to :region, optional: true

  has_many :pricings
end
