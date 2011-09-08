class Recipe < ActiveRecord::Base

  belongs_to :author, :class_name => "User"

  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  has_many :entries
  has_many :cooks ,:foreign_key => :owner_id, :class_name => "User" ,:through => :entries

  has_many :comments
  has_many :actions, :class_name => "Activity", :as => :target, :dependent => :destroy

  has_attached_file :image, :styles => { 
    :medium => "300x300",
    :thumb => "100x100"
  }

  #validation
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :instructions
  validates_presence_of :ingredients
  validates_presence_of :author_id

  default_scope :order => "recipes.created_at DESC"

  scope :from_users_followed_by, lambda {|user| followed_by(user)}

  scope :search_for, lambda {|query| search(query) }

  def tags_names 
    tags ? tags.split() : []
  end

  def self.followed_by(user)
    following_ids = %(SELECT followed_id FROM relationships 
                      WHERE follower_id = :user_id)
    where("author_id IN (#{following_ids}) OR author_id = :user_id",
          { :user_id => user })
  end

  def self.search(query)
    condition = %(recipes.name LIKE :query OR ingredients.name LIKE :query)
    Recipe.joins(:ingredients).where(condition,{:query => "%#{query}%" })
  end

  def likes
    actions.where(:action => [:like,:cook]).count
  end

  def medium_image
    image.url(:medium)
  end
end

