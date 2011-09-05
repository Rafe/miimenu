class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.string :text
      t.integer :recipe_id

      t.timestamps
    end

    add_index :comments, :recipe_id
  end
end
