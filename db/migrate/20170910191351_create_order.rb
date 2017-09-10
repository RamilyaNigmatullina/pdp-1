class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.references :warehouse, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
