class Offer < ApplicationRecord
  validates :code, :version, :publication_date, presence: true
  validates_uniqueness_of :code, case_sensitive: true

  has_many :products
end
