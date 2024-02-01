module Api
  module V1
    class CartItemsController < ApiController 
      before_action :set_cart
      before_action :set_cart_item, only: [:remove]

      def add
        product = Product.find(params[:product_id])
        quantity = params[:quantity].presence || 1
        @cart_item = @cart.line_items.find_or_initialize_by(product: product)
        @cart_item.quantity = @cart_item.quantity.to_i
        if @cart_item.save
          @cart.total_items += 1
          render json: {message: product.name +  ' added to cart', cart: @cart}, status: :ok
        else
          render json: { errors: @cart_item.errors.full_messages}, status: :unprocessable_entity
      end
    end

def remove
  if @cart_item
    @cart_item.quantity -= 1
    if @cart_item.quantity = 0
      @cart_item.destroy
      message = 'item removed from cart'
    else
      @cart_item.save
      message = 'quantity updated'
    end
    render json: {message: message, cart_item: @cart_item}, status: :ok
  else
    render json: {error: 'Cart item not found'}, status: :not_found
  end
end
      
      private

      def set_cart
        @cart = Cart.find(params[:cart_id])
        

      end
    

      def set_cart_item
        @cart_item = CartItem.find_by(id: params[:cart_item_id])
        if @cart_item && @cart_item.cart.user_id == current_user.id
      else
        render json: { error: 'Not authorized to access this cart' }, status: :forbidden
      end
      end

  
  end
end
end
  

