# app/admin/line_items.rb
ActiveAdmin.register LineItem do
    belongs_to :product
  
    show do
      attributes_table do
        row :product
        # Add other attributes of the LineItem model as needed
      end
    end
  end