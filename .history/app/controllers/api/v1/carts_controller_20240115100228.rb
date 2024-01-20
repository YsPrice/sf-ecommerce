module Api
  module V1
    class CartsController < ApiController 
      before_action :set_cart, only: [:show, :update, :destroy]

      # GET /api/v1/carts/:id
      def show
        render json: @cart
      end

      # POST /api/v1/carts
      def create
        @cart = Cart.new(cart_params)
        if @cart.save
          render json: @cart, status: :created
        else
          render json: @cart.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/carts/:id
      def update
        if @cart.update(cart_params)
          render json: @cart
        else
          render json: @cart.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/carts/:id
      def destroy
        @cart.destroy
        head :no_content
      end

      private

      def set_cart
        @cart = current_user.carts.find(params[:id])
  
      end

      def cart_params
       
        params.require(:cart).permit(:user_id, :other_attributes)
      end
    end
  end
end
