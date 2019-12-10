class CreateCarts < ActiveRecord::Migration[6.0]
    def change
      create_join_table :products, :users, column_options: { null: false, foreign_key: true } do |t|
        t.index :product_id
        t.index :user_id
    end
  end
end
