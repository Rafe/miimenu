class AddCategoryToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :category, :string, :default => "To make"
  end
end
