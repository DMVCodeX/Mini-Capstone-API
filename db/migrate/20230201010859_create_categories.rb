class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :chocolate
      t.string :nuts
      t.string :vegan
      t.string :gluten_free
      t.string :fruit
      t.string :pastry

      t.timestamps
    end
  end
end
