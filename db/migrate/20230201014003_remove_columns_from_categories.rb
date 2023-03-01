class RemoveColumnsFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :chocolate, :string
    remove_column :categories, :nuts, :string
    remove_column :categories, :vegan, :string
    remove_column :categories, :gluten_free, :string
    remove_column :categories, :fruit, :string
    remove_column :categories, :pastry, :string
  end
end
