class Order < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :products, through: :transactions
end
