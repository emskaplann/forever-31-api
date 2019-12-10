class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :color_name
      t.string :color_id
      t.string :image_extension
      t.string :list_price

      t.timestamps
    end
  end
end
