class ProductsUserSerializer < ActiveModel::Serializer
  attributes :product, :product_images, :quantity, :size
  def product_images
    self.object.product.product_images
  end
end
