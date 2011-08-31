class Menu < ActiveRecord::Base

  CATEGORY = ['To make','Favorites','Test']

  belongs_to :user
  belongs_to :recipe

  validates_inclusion_of :category, :in => CATEGORY 

  default_scope :order => "menus.created_at DESC"

  def self.categorys 
    CATEGORY
  end

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

