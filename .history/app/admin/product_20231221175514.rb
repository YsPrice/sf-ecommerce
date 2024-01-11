# app/admin/product.rb
ActiveAdmin.register Product do
    permit_params :name, :price, :quantity, :image, :category,
  
    form do |f|
      f.inputs 'Product Details' do
        f.input :name
        f.input :price
        f.input :quantity
        f.input :category, as: :select, collection: Product.categories.keys
        f.input :image, label: 'Image URL'
      end
      f.actions
    end
  
    controller do
        def create
          @product = Product.new(permitted_params[:product])
          
          # Assuming image_url is a text attribute in your Product model
          @product.image = params[:product][:image]
      
          if @product.save
            redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
          else
            render :new
          end
        end
      
        def update
          @product = Product.find(params[:id])
          @product.attributes = permitted_params[:product]
          
          # Assuming image_url is a text attribute in your Product model
          @product.image = params[:product][:image]
      
          if @product.save
            redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
          else
            render :edit
          end
        end
      end
      
  end
  