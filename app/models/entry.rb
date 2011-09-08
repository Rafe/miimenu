class Entry < ActiveRecord::Base
  belongs_to :owner , :class_name => "User"
  belongs_to :recipe

  validates_presence_of :recipe, :menu
  validates_uniqueness_of :recipe_id, :scope => [:owner_id,:menu]
end
