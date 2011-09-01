class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  validates_presence_of :name

  has_many :menus , :foreign_key => "owner_id", :dependent => :destroy
  has_many :recipes, :foreign_key => "author_id"

  has_many :relationships, :foreign_key => "follower_id",
           :dependent => :destroy

  has_many :following , :through => :relationships , :source => :followed

  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy

  has_many :followers, :through => :reverse_relationships, :source => :follower

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  def to_make
    menu = menus.find_by_name("To make")
    if menu
      menu
    else
      menus.create()
    end
  end

  def liked?(recipe)
    menus.includes(:recipes).each do |menu|
      return true if menu.recipes.include?(recipe)
    end
    false
  end

  def feed
    Recipe.from_users_followed_by(self)
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  def like!(recipe,menu="To make")
    menus.create(:name => menu) if menus.count == 0
    menus.find_by_name(menu).entries.create(:recipe => recipe)
  end

  def menu_names
    menus.map do |m|
      m.name
    end
  end

end
# == Schema Information
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  name                 :string(255)
#

