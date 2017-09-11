class WarehousesController < ApplicationController
  expose(:warehouses) { Warehouse.all }
  expose(:warehouse)

  helper_method :products_data

  def index
  end

  def new
  end

  def create
    warehouse.warehouse_products.each { |wp| wp.warehouse = warehouse }
    warehouse.save
    respond_with warehouse
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:title, warehouse_products_attributes: %w(product_id amount))
  end

  def products_data
    @products_data ||= Product.all
  end
end
