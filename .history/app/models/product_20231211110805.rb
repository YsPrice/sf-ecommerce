class Product < ApplicationRecord
    validates :name, :price, :quantity, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  
    has_many :line_items
    has_many :orders, through: :line_items
  
    # def self.upload_products_with_images(products_data)
    #   products_data.each do |product_params|
    #     product = new(product_params.except(:image_url))
  
    #     # Download the image from Google Cloud Storage
    #     image_url = product_params[:image_url]
    #     product.image.attach(io: open(image_url), filename: File.basename(image_url)) if image_url
  
    #     # Save the product with image
    #     product.save
    #   end
    # end
  end
  