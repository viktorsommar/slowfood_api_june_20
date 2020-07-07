class Api::V1::ProductController < ApplicationController

  def index
    @products = Product.all
  end

end
