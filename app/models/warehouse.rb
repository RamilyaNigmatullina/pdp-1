class Warehouse < ActiveRecord::Base
  has_many :warehouse_products
  accepts_nested_attributes_for :warehouse_products, allow_destroy: true

  def remove(product, amount)
    warehouse_product = warehouse_product(product)
    warehouse_product.update(amount: warehouse_product.amount - amount)
  end

  def product?(product, amount)
    warehouse_product = warehouse_product(product)
    warehouse_product.amount >= amount
  end

  private

  def warehouse_product(product)
    WarehouseProduct.find_by(product: product, warehouse: self)
  end
end
