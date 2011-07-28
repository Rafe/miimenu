class Recipe < ActiveRecord::Base

  belongs_to :author, :class_name => "User"
  has_many :ingredients

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
