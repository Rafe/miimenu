class Ingredient < ActiveRecord::Base
  belongs_to :recipe
end
# == Schema Information
#
# Table name: ingredients
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  quantity   :string(255)
#  recipe_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

