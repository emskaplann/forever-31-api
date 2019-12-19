class AddressSerializer < ActiveModel::Serializer
  attributes :id, :line_1, :line_2
  has_one :user
end
