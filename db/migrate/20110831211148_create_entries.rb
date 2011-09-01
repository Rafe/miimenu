class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :menu_id
      t.integer :recipe_id
      t.timestamps
    end
    add_index :entries , :menu_id
  end
end
