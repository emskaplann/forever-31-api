class ProductsUser < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validate :uniq_product_and_user, on: :create

  # checking if cart is already created
  private
  def uniq_product_and_user
      @all_couples = ProductsUser.all.map{ |pu| pu.user_id.to_s + pu.product_id.to_s }
      if @all_couples.include?(self.user_id + self.product_id)
        errors.add(:product_id, "should be unique")
      end
  end

end
