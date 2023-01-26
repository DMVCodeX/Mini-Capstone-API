class AddImages < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :images, :integer
  end
end
