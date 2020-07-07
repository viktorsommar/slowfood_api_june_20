class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: {products: products}
  end

  def show
    product = Product.find(params[:id])
  end

  def create
    product = Product.create
  end
end
