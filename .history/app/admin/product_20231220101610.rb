# app/admin/product.rb
ActiveAdmin.register Product do
    permit_params :name,  :price, :quantity, :image_url
  
    form do |f|
      f.inputs 'Product Details' do
        f.input :name
        f.input :price
        f.input :quantity
        f.input :image_url
      end
      f.actions
    end
  
    controller do
      def create
        @product = Product.new(permitted_params[:product])
        upload_result = Cloudinary::Uploader.upload(params[:product][:image_url].tempfile.path)
        @product.image_url = upload_result['secure_url']
  
        if @product.save
          redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
        else
          render :new
        end
      end
  
      def update
        @product = Product.find(params[:id])
        @product.attributes = permitted_params[:product]
  
        if params[:product][:image_url].present?
          upload_result = Cloudinary::Uploader.upload(params[:product][:image_url].tempfile.path)
          @product.image_url = upload_result['secure_url']
        end
  
        if @product.save
          redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
        else
          render :edit
        end
      end
    end
  end
  