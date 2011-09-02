class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :type
      t.string :target_type
      t.integer :target_id

      t.timestamps
    end

    add_index :activities , :user_id
    add_index :activities , :type
  end
end
