module Api
  module V1
# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  # GET /products or /products.json
  def index
    if params[:search].present?
      @products = search_products(params[:search])
    else
      @products = Product.all
    end

    render json: @products
  end

  private

  def search_products(search_params)
    products = Product.all
    products = products.where("name ILIKE ?", "%#{search_params[:name]}%") if search_params[:name].present?
    products = products.where(category: search_params[:category]) if search_params[:category].present?
    products
  end
end

end
end
