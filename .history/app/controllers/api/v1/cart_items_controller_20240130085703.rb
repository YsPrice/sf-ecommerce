module Api
  module V1
    class CartItemsController < ApiController
      before_action :set_cart
      before_action :set_cart_item, only: [:remove]

      def add
        product = Product.find(params[:product_id])
        quantity = params[:quantity].presence || 1
        @cart_item = @cart.cart_items.find_or_initialize_by(product_id: product_id)
        @cart_item.quantity += quantity.to_i

        if @cart_item.save
          @cart.update_totals # Update cart totals
          render json: { message: @product.name + ' added to cart', cart: @cart }, status: :ok
        else
          render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def remove
        # ... existing logic for removing an item ...
        @cart.update_totals # Update cart totals after removal
        # ... rest of the method ...
      end

      private

      def set_cart
        @cart = Cart.find(params[:cart_id])
      
      
      end

      def set_cart_item
        @cart_item = @cart.cart_items.find_by(id: params[:cart_item_id])
        # ... existing logic ...
      end
    end
  end
end
