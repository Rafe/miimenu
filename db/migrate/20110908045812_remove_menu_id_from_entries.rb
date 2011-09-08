class RemoveMenuIdFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :menu_id
  end
end
