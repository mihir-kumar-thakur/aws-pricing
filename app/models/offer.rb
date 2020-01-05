class Offer < ApplicationRecord
  validates :code, :version, :publication_date, presence: true
  validates :code, uniqueness: true

  has_many :products
end
