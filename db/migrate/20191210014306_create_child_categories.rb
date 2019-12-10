class CreateChildCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :child_categories do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.string :name
      t.string :gender
      t.string :image_path

      t.timestamps
    end
  end
end
