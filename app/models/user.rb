class User < ApplicationRecord
  has_many :orders
  has_many :carts
  has_many :products, through: :carts
  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false
  has_secure_password
end
