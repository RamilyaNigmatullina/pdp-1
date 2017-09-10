class Product < ActiveRecord::Base
  has_many :warehouse_products
end
