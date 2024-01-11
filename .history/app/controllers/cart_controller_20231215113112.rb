class CartController < ApplicationController
    before_action :authenticate_user!
    before_action :set_cart, only: [:show, :checkout]



    def checkout
    end