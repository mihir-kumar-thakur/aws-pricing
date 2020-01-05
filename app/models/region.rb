class Region < ApplicationRecord
  validates :name, :code, presence: true
  validates_uniqueness_of :name, :code, case_sensitive: true

  has_many :products
end
