class Warehouse < ActiveRecord::Base
  has_many :warehouse_products
  accepts_nested_attributes_for :warehouse_products, allow_destroy: true
end
