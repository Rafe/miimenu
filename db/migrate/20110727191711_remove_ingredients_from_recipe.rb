class RemoveIngredientsFromRecipe < ActiveRecord::Migration
  def up
    remove_column :recipes, :ingredients
  end

  def down
    add_column :recipes, :ingridients, :text
  end
end
