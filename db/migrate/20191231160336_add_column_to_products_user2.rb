class AddColumnToProductsUser2 < ActiveRecord::Migration[6.0]
  def change
    add_column :products_users, :size, :string
  end
end
