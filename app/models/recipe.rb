class Recipe < ActiveRecord::Base

  belongs_to :author, :class_name => "User"

  has_many :ingredients
  accepts_nested_attributes_for :ingredients
  has_many :menus 
  has_many :cooks, :through => :menus, :source => :user

  has_attached_file :image, :styles => { 
    :medium => "300x300",
    :thumb => "100x100"
  }

  default_scope :order => "recipes.created_at DESC"

  scope :from_users_followed_by, lambda {|user| followed_by(user)}

  def self.followed_by(user)
    following_ids = %(SELECT followed_id FROM relationships 
                      WHERE follower_id = :user_id)
    where("author_id IN (#{following_ids}) OR author_id = :user_id",
          { :user_id => user })
  end
end
# == Schema Information
#
# Table name: recipes
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  description        :text
#  instructions       :text
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  author_id          :integer(4)
#  tags               :string(255)
#

