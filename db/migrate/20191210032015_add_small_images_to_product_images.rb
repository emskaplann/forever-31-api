class AddSmallImagesToProductImages < ActiveRecord::Migration[6.0]
  def change
    add_column :product_images, :small_front_url, :string
    add_column :product_images, :small_side_url, :string
    add_column :product_images, :small_back_url, :string
    add_column :product_images, :small_full_url, :string
    add_column :product_images, :small_detail_url, :string
  end
end
