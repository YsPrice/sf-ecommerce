class CartController < ApplicationController
    before_action :authenticate_user!
    before_action :set_cart, only: [:show, :checkout]

def add_to_cart
    @product = Product.find(params[:product_id])
    @cart_item = current_user.cart_items.find_by(product: product)
    if @cart_item
        @cart_item.increment!(:quantity)
    else
        current_user.cart_items.create(product: product, quantity: 1)
    end
    render json: { message: 'Producted added to cart successfully' }
end

def remove_from_cart
if @cart_item
    @cart_item.decrement!(:quantity)
    @cart_item.destroy if @cart_item.quantity.zero?
end
render json: {message: 'item successfully removed'}
end
end

