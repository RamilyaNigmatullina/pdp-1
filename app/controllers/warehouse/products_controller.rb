class Warehouse
  class ProductsController < ApplicationController
    respond_to :json

    expose(:warehouse)

    def index
      product_ids = warehouse.warehouse_products.pluck(:product_id)
      products = Product.where(id: product_ids)
      render json: products.to_json
    end
  end
end
