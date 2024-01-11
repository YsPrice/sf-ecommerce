class CartController < ApplicationController
    before_action :set_cart, only: [:show, :checkout]

    def show 
      render json:@cart
    end

def add
    
end


    def checkout
    end