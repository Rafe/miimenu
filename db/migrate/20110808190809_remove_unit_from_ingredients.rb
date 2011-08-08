class RemoveUnitFromIngredients < ActiveRecord::Migration
  def up
    remove_column :ingredients, :unit
    change_column :ingredients, :quantity, :string
  end

  def down
    add_column :ingredients, :unit , :string
  end
end
