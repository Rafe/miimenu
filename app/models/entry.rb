class Entry < ActiveRecord::Base
  belongs_to :menu
  belongs_to :recipe
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

