class AddColumnToProductsUser < ActiveRecord::Migration[6.0]
  def change
    add_column :products_users, :id, :primary_key
    add_column :products_users, :quantity, :integer
    add_column :orders_products, :id, :primary_key
  end
end
