class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients

  has_attached_file :image, :styles => { 
    :medium => "300x300",
    :thumb => "100x100"
  }

  default_scope :order => "created_at DESC"
end
# == Schema Information
#
# Table name: recipes
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  description        :text
#  ingredients        :text
#  instructions       :text
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  user_id            :integer(4)
#
