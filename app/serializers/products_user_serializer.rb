class ProductsUserSerializer < ActiveModel::Serializer
  attributes :product, :product_images
  def product_images
    self.object.product.product_images
  end
end
