class AddNameIndexToMenus < ActiveRecord::Migration
  def change
    add_index :menus, :name
  end
end
