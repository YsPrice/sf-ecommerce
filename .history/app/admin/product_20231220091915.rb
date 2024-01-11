
ActiveAdmin.register Product do
show do
    
    attributes_table do
        has_many :line_items
      row :name
      row :description
      row :price
      row :image do |product|
        image_tag product.image, alt: 'Product Image' if product.image.present?
      end
    end
  end

end