class ProductSerializer < ActiveModel::Serializer
  attributes :id, :brand, :display_name, :category_name, :on_sale, :description, :list_price, :image_extension, :images, :variant_images

  def images
    self.object.product_images
  end

  def variant_images
    self.object.variant_images
  end
end
