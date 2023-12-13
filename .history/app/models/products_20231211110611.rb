class Products < ApplicationRecord
    validates :name, :price, :image, :quantity, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0}
    validates :quantity, numericality: { greater_than_or_equal_to: 0}

    has_many :line_items
    has_many :orders, through: :line_items
end