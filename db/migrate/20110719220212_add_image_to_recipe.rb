class AddImageToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :image_file_name, :string
    add_column :recipes, :image_content_type, :string
    add_column :recipes, :image_file_size, :integer
    add_column :recipes, :image_updated_at, :datetime
  end
end
