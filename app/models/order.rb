class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :warehouse

  validate :product_amount

  def product_amount
    in_stock = WarehouseProduct.find_by(product: product, warehouse: warehouse).amount

    errors.add(:base, "We don't have so much alcohol :(") if amount > in_stock
  end
end
