class WishList < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validate :uniq_product_and_user, on: :create

  # checking if wishlist is already created
  def uniq_product_and_user
      @all_couples = WishList.all.map{ |pu| pu.user_id + pu.product_id }
      if @all_couples.include?(self.user_id + self.product_id)
        errors.add(:product_id, "should be unique")
      end
  end
end
