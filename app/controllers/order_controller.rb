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

end