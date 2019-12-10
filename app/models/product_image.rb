class ProductImage < ApplicationRecord
  belongs_to :product
  validates :front_url, uniqueness: true
end
