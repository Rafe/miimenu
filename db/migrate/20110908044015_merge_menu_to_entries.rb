class MergeMenuToEntries < ActiveRecord::Migration
  def change
    drop_table :menus

    add_column :entries, :menu, :string
    add_column :entries, :owner_id, :integer

    add_index :entries, [:owner_id,:menu,:recipe_id]
  end
end
