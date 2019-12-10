class Variant < ApplicationRecord
  belongs_to :product
  has_many :variant_images
  validates :color_id, uniqueness: true
end
