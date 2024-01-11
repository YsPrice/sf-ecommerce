show do
    attributes_table do
      row :name
      row :description
      row :price
      row :image do |product|
        image_tag product.image, alt: 'Product Image' if product.image.present?
      end
    end
  end
