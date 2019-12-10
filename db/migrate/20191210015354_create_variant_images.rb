class CreateVariantImages < ActiveRecord::Migration[6.0]
  def change
    create_table :variant_images do |t|
      t.belongs_to :variant, null: false, foreign_key: true
      t.string :front_url
      t.string :side_url
      t.string :back_url
      t.string :full_url
      t.string :detail_url

      t.timestamps
    end
  end
end
