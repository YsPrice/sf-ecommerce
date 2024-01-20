# app/models/cart.rb
class Cart < ApplicationRecord
    has_many :line_items
    has_many :products, through: :line_items
    belongs_to :user, optional: false
  
    def total_price
      line_items.sum(&:total_price)
    end
  
    # Other attributes and methods as needed
  end
  