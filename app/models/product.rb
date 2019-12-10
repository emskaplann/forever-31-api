class Product < ApplicationRecord
  has_many :transactions
  has_many :orders, through: :transactions
  has_many :product_images
  has_many :variants
  has_many :variant_images, through: :variants
  has_many :carts
  has_many :users, through: :carts

  validates :description, uniqueness: true
end
