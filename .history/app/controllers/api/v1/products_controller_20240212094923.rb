module Api
  module V1

class ProductsController < ApplicationController

  def index
    if params[:search].present?
      @products = search_products(params[:search])
    else

        @products = Product.page(params[:page]).per(params[:per_page])
    end

    render json: @products
  end
  
  def show
    product = Product.find(params[:id])
    render json: product
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Product not found" }, status: :not_found
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
  
  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end
  
end

end
end
