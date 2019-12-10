class Variant < ApplicationRecord
  belongs_to :product
  has_many :variant_images
  validates :image_extension, uniqueness: true
end
