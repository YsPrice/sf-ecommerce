module Api
  module V1
    class CartItemsController < ApiController 
      before_action :set_product, only: [:add_to_cart]
      before_action :set_cart_item, only: [:remove_from_cart]

      def create
        @cart_item = current_user.cart.cart_items.find_or_initialize_by(product: @product)
        @cart_item.quantity += 1
        if @cart_item.save
          render json: { message: 'Product added to cart successfully', cart_item: @cart_item }, status: :ok
        else
          render json: @cart_item.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @cart_item
          @cart_item.quantity -= 1
          if @cart_item.quantity.zero?
            @cart_item.destroy
            message = 'Product removed from cart'
          else
            @cart_item.save
            message = 'Product quantity updated'
          end
          render json: { message: message, cart_item: @cart_item }, status: :ok
        else
          render json: { error: 'Cart item not found' }, status: :not_found
        end
      end

      private

   
      def set_product
        @product = Product.find_by(id: cart_item_params[:product_id])
        render json: { error: 'Product not found' }, status: :not_found unless @product
      end

      def cart_item_params
        params.require(:cart_item).permit(:product_id, :quantity)
      end
      def set_cart_item
        @cart_item = current_user.cart.cart_items.find_by(id: params[:id])
        render json: { error: 'Cart item not found' }, status: :not_found unless @cart_item
      end
    end
  end
end
