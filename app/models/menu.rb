class Menu < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  default_scope :order => "menus.created_at DESC"

end
# == Schema Information
#
# Table name: menus
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  recipe_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

