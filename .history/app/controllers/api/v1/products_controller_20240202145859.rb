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
    if search_params[:name].present?
      name_query = search_params[:name].downcase
      products = products.where("LOWER(name) LIKE ?", "%#{name_query}%")
    end
    if search_params[:category].present?
      category_query = search_params[:category].upcase
      products = products.where(category: Product.categories[category_query])
    end
  end
end

end
end
