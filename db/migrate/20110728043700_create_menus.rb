class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
