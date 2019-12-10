class ProductSerializer < ActiveModel::Serializer
  attributes :id, :brand, :display_name, :category_name, :description, :image_extension, :images
  def images
    self.object.product_images
  end
end
