class AddProductIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :product_id, :integer, index: true
  end
end
