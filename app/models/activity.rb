class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, :polymorphic => true

  attr_accessible :action,:target

  validates_presence_of :user, :action, :target
  validates_uniqueness_of :target_id, :scope => [:user_id,:target_type]
end
