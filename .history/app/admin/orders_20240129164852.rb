ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :total_items, :total_price, :order_number, :status
  
  # or
  
  # permit_params do
  #   permitted = [:user_id, :total_items, :total_price, :order_number, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # app/admin/orders.rb
ActiveAdmin.register Order do
  # Permit the parameters that can be updated through Active Admin
  permit_params :status, :total_price, :user_id # Update this with actual order attributes

  # Customizing the Index page
  index do
    selectable_column
    id_column
    column :status
    column :total_price
    column :user
    column :created_at
    actions
  end

  # Customizing the Show page
  show do
    attributes_table do
      row :status
      row :total_price
      row :user
      # Include other fields as needed
    end
    # Display associated line items if needed
    panel "Line Items" do
      table_for order.line_items do
        column :product
        column :quantity
        # Include other line item fields as needed
      end
    end
  end

  # Customizing the Form
  form do |f|
    f.inputs 'Order Details' do
      f.input :status
      f.input :total_price
      f.input :user # Assuming `Order` belongs to `User`
      # Include other inputs as needed
    end
    f.actions
  end
end

end
