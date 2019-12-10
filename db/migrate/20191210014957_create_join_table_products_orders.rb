class CreateJoinTableProductsOrders < ActiveRecord::Migration[6.0]
  def change
    create_join_table :products, :orders, column_options: { null: false, foreign_key: true } do |t|
      t.index :product_id
      t.index :order_id
    end
  end
end
