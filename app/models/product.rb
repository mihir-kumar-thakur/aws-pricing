class Product < ApplicationRecord
  validates :sku, presence: true
  validates_uniqueness_of :sku, case_sensitive: true

  belongs_to :offer
  belongs_to :region, optional: true

  has_many :pricings
end
