class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :category_name
      t.boolean :coming_soon
      t.string :description
      t.string :description_of_deal
      t.string :display_name
      t.boolean :free_shipping
      t.string :image_extension
      t.boolean :student_deal
      t.string :item_code
      t.boolean :on_sale
      t.string :orig_product_id
      t.string :product_share_link
      t.string :product_size_chart
      t.string :list_price
      t.string :shipping_fee
      t.belongs_to :child_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
