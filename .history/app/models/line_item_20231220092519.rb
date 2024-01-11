class LineItem < ApplicationRecord
    belongs_to :product
    belongs_to :order
    # ... other associations and validations as needed
  end