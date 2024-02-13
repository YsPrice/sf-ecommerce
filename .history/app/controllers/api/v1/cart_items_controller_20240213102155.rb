module Api
  module V1
    class CartItemsController < ApplicationController
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
          render json: { message: @product.name + ' was added to your cart', cart: @cart }, status: :ok
        else
          render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
      end
      def update_item
        cart = Cart.find(params[:cart_id])
        item = cart.cart_items.find_by(product_id: params[:item_id])
    
        if item
          new_quantity = update_quantity_params[:quantity]
          if new_quantity.positive?
            item.update(quantity: new_quantity)
            render json: { message: 'Cart item updated successfully' }, status: :ok
          else
            item.destroy
            render json: { message: 'Cart item removed' }, status: :ok
          end
        else
          render json: { error: 'Item not found in cart' }, status: :not_found
        end

      def remove
        @product = Product.find(params[:product_id])
        cart_item = @cart.cart_items.find_or_initialize_by(product_id: @product.id)
      
        if cart_item.nil?
          render json: { error: 'Cart item not found' }, status: :not_found
          return
        end
        quantity_to_remove = params[:quantity].to_i || 1 
      
        if cart_item.quantity > quantity_to_remove
          cart_item.quantity -= quantity_to_remove
          if cart_item.save
            @cart.update_cart_totals
            render json: { message: 'Quantity was updated', cart: @cart }, status: :ok
          else
            render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
          end
        elsif cart_item.quantity <= quantity_to_remove
          cart_item.destroy
          @cart.update_cart_totals
          render json: { message: 'Item was removed from your cart', cart: @cart }, status: :ok
        else
          render json: { error: 'Invalid operation' }, status: :unprocessable_entity
        end
      end

      private

      def set_cart
        @cart = Cart.find(params[:cart_id])
      
      
      end
      
      def update_quantity_params
        params.require(:cart_item).permit(:quantity)
      end
      def set_cart_item
        @cart_item = @cart.cart_items.find_by(id: params[:cart_item_id])
        # ... existing logic ...
      end
    end
  end
end
