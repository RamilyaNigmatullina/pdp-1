class ProductsController < ApplicationController
  expose(:products) { Product.all }
  expose(:product)

  def index; end

  def new; end

  def create
    product.save
    respond_with product, location: products_path
  end

  private

  def product_params
    params.require(:product).permit(:title)
  end
end
