class Comment < ActiveRecord::Base
  belongs_to :recipe 
  belongs_to :commenter, :class_name => "User"

  validates_presence_of :recipe, :commenter, :text
end
