class RenameUserToAuthorFromRecipe < ActiveRecord::Migration
  def change
    rename_column :recipes, :user_id, :author_id
  end
end
