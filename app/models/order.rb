class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :warehouse

  validate :product_amount_in_wareouse

  def product_amount_in_wareouse
    errors.add(:base, "We don't have so much alcohol") unless warehouse.product?(product, amount)
  end
end
