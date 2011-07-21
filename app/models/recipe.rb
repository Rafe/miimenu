class Recipe < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { 
    :medium => "300x300",
    :thumb => "100x100"
  }

  default_scope :order => "created_at DESC"
end
