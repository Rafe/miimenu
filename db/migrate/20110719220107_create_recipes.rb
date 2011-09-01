class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :author_id
      t.string :tags
      t.text :description
      t.text :instructions

      t.timestamps
    end
  end
end
