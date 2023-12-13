class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :product do |t|

      t.timestamps
    end
  end
end
