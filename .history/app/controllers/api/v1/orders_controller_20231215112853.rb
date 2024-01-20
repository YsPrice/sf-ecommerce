class OrderController < ApplicationController
 before_action :set_order, only: [:show]
 before_action :authenticate_user!, only: [:index, :show]

    def index
        @orders = current_user.orders
        render json: @orders
    end

    def show
        render json: @order
    end
private

def set_order 
@order = current_user.orders.find(params[:id])
end

end