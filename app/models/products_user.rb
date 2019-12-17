class ProductsUser < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validate :uniq_product_and_user

  def uniq_product_and_user
      @all_couples = ProductsUser.all.map{ |pu| pu.user_id + pu.product_id }
      if @all_couples.include?(self.user_id + self.product_id)
        errors.add(:product_id, "should be unique")
      end
  end

  private
  # checking if cart is already created if it's so just update the quantity => for controller
  def uniq_product_and_user
      @all_couples = ProductsUser.all.map{ |pu| pu.user_id + pu.product_id }
      if @all_couples.include?(self.user_id + self.product_id)
        return true
      end
  end

end
