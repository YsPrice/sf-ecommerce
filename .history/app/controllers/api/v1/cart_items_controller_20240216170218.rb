module Api
  module V1
    class CartItemsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_cart
      
      before_action :set_cart_item, only: [:remove]

      def add
        @product = Product.find(params[:product_id])
        quantity = params[:quantity].presence || 1
        @cart_item = @cart.cart_items.find_or_initialize_by(product_id: @product.id)
        @cart_item.quantity += quantity.to_i
        if @cart_item.quantity > @product.quantity.to_i
          render json: { message: "There are only #{@product.quantity} of this product available. Please adjust the quantity." }, status: :unprocessable_entity
          return
        end

        if @cart_item.save
          @cart.update_cart_totals 
          render json: { message: @product.name + ' was added to your cart', cart_item: @cart_item, cart: @cart }, status: :ok
        else
          render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      def update
        cart_item = @cart.cart_items.find(params[:id])
    
        if cart_item.update(cart_item_params)
          render json: { message: 'Cart item updated successfully', cart_item: cart_item, cart:@cart }, status: :ok
        else
          render json: cart_item.errors, status: :unprocessable_entity
        end
      end
    

      def destroy
        cart_item = @cart.cart_items.find_by(id: params[:id])

        if cart_item
          cart_item.destroy
          @cart.update_cart_totals
          render json: { message: 'Item was removed from your cart', cart: @cart }, status: :ok
        else
          render json: { error: 'Cart item not found' }, status: :not_found
        end
      end



      private

      def set_cart
  
        def set_cart
          @cart = current_user.cart || current_user.create_cart
        end

      end
      


      private
    
      def authenticate_user!

        unless current_user
          render json: { error: 'Not Authenticated' }, status: :unauthorized
        end
      end
      def cart_item_params
        params.require(:cart_item).permit(:quantity)
      end
     def set_cart_item
        # Logic to set @cart_item based on :id
        @cart_item = @cart.cart_items.find_by(id: params[:id])
      end
    end
  end
end
