class VariantImage < ApplicationRecord
  belongs_to :variant
  validates :front_url, uniqueness: true
end
