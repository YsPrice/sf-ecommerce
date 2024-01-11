class Product < ApplicationRecord
    validates :name, :price, :quantity, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  
    has_many :line_items
    has_many :orders, through: :line_items
  
  
    # end
  end
  
  # active admin gem, good for creating resources.
  # login as admin and create products through ui
