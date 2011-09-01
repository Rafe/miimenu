class Menu < ActiveRecord::Base
  belongs_to :owner , :class_name => "User"
  has_many :entries, :dependent => :destroy
  has_many :recipes, :through => :entries

  validates_presence_of :name
end
# == Schema Information
#
# Table name: menus
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)     default("To make")
#

