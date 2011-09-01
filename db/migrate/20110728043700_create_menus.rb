class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :owner_id
      t.string :name ,:default => "To make"
      t.timestamps
    end

    add_index :menus, :owner_id
  end
end
