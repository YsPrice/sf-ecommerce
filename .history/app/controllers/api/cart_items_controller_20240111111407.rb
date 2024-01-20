module Api
    module V1
        

    class CartItemsController < ApplicationController
        def add_to_cart
            @product = Product.find(params[:product_id])
            @cart_item = current_user.cart_items.find_by(product: product)
            if @cart_item
                @cart_item.increment!(:quantity)
            else
                current_user.cart_items.create(product: product, quantity: 1)
            end
            render json: { message: 'Product added to cart successfully' }
        end
        def remove_from_cart
            if @cart_item
                @cart_item.decrement!(:quantity)
                @cart_item.destroy if @cart_item.quantity.zero?
            end
            render json: {message: 'Product successfully removed'}
            end
    end
end
end
end