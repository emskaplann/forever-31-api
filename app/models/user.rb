class User < ApplicationRecord
  has_many :orders
  has_many :carts
  has_many :products, through: :carts
  has_secure_password
end
