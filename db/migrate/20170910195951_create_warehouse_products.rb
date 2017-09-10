class CreateWarehouseProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :warehouse_products do |t|
      t.references :warehouse, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
