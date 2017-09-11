class OrdersController < ApplicationController
  expose(:order)

  helper_method :warehouses_data

  def new
  end

  def create
    result = Orders::Save.call(order: order).order
    respond_with result
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :warehouse_id, :amount)
  end

  def warehouses_data
    Warehouse.all
  end
end
