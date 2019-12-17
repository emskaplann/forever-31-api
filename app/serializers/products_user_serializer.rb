class ProductsUserSerializer < ActiveModel::Serializer
  attributes :product, :product_images, :quantity
  def product_images
    self.object.product.product_images
  end
end
