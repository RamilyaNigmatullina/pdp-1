class CreateWarehouse < ActiveRecord::Migration[5.0]
  def change
    create_table :warehouses do |t|
      t.string :title

      t.timestamps
    end
  end
end
