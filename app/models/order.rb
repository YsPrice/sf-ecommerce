# app/models/order.rb
class Order < ApplicationRecord
    belongs_to :user
    has_many :line_items
    has_many :products, through: :line_items
  
    validates :status, presence: true
  
    def total_price
      line_items.sum(&:total_price)
    end
  
    # Other attributes and methods as needed
  end
  