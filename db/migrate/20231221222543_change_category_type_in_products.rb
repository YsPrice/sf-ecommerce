class ChangeCategoryTypeInProducts < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :category, :integer, using: 'category::integer'
  end

  def down
    change_column :products, :category, :string
  end
end
