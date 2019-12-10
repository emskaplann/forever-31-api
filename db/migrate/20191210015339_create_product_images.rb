class CreateProductImages < ActiveRecord::Migration[6.0]
  def change
    create_table :product_images do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :front_url
      t.string :side_url
      t.string :back_url
      t.string :full_url
      t.string :detail_url

      t.timestamps
    end
  end
end
