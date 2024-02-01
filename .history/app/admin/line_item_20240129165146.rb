# app/admin/line_items.rb
ActiveAdmin.register LineItem do
    belongs_to :product
  
    show do
      attributes_table do
        row :product

      end
    end
  end