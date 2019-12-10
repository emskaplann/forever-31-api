class AddSmallImagesToVariantImages < ActiveRecord::Migration[6.0]
  def change
    add_column :variant_images, :small_front_url, :string
    add_column :variant_images, :small_side_url, :string
    add_column :variant_images, :small_back_url, :string
    add_column :variant_images, :small_full_url, :string
    add_column :variant_images, :small_detail_url, :string
  end
end
