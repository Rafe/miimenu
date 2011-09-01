class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity
      t.integer :recipe_id
      t.timestamps
    end

    add_index :ingredients,:recipe_id
  end
end
