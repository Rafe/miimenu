class RenameActivitiesTypeToAction < ActiveRecord::Migration
  def change 
    rename_column :activities, :type, :action
  end
end
