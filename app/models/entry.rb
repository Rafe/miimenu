class Entry < ActiveRecord::Base
  belongs_to :menu
  belongs_to :recipe

  validates_presence_of :menu
  validates_presence_of :recipe
  validates_uniqueness_of :recipe_id, :scope => :menu_id
end
# == Schema Information
#
# Table name: entries
#
#  id         :integer(4)      not null, primary key
#  owner_id   :integer(4)
#  recipe_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

