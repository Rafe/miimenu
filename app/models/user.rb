require "digest/md5"
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable,:omniauthable

  validates_presence_of :name

  has_many :entries , :foreign_key => "owner_id", :dependent => :destroy
  has_many :menus , :through => :entries, :source => :recipe
  has_many :recipes, :foreign_key => "author_id"
  has_many :comments, :foreign_key => "commenter_id"

  has_many :relationships, :foreign_key => "follower_id",
           :dependent => :destroy

  has_many :following , :through => :relationships , :source => :followed

  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy

  has_many :followers, :through => :reverse_relationships, :source => :follower

  has_many :activities, :dependent => :destroy
  has_many :actions, :class_name => "Activity", :as => :target, :dependent => :destroy

  has_many :authentications

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :image_url
  attr_accessor :current_user

  def is_followed 
    current_user.following?(self) ? true : false
  end

  def to_make
    menus.where("entries.menu = 'To make'")
  end

  def to_make_in_json
    to_make.to_json( methods: :thumb_image )
  end

  def menu_names
    entries.group(:menu).select("count(*) count, menu")
  end

  def liked?(recipe)
    activities.where(:target_type => :recipe,:target_id => recipe.id).first ? true : false
  end

  def cooking?(recipe)
    entries.find_by_recipe_id(recipe.id) ? true : false
  end

  def feed
    Recipe.from_users_followed_by(self)
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create(:followed_id => followed) unless followed == id
  end

  def unfollow!(followed)
    follow = relationships.find_by_followed_id(followed) 
    follow.destroy if follow
    false
  end

  def cook!(recipe,menu="To make")
    activities.create(:target => recipe,:action =>:cook)
    entries.create(:recipe => recipe, :menu => menu)
  end

  def like!(resource)
    activities.create(:target => resource,:action =>:like)
  end
  
  def gravatar_url
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    image_url = "http://gravatar.com/avatar/#{gravatar_id}"
  end

  def followers_count
    followers.count
  end

  def recipes_count
    recipes.count
  end
  
  #check for sample website to put it as a common method
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    #1.find authentications exist, => true, sync and return user, false => user? build auth, build user with auth
    user_info = access_token['user_info']

    authentication = Authentication.find_by_uid_and_provider(access_token['uid'],access_token['provider'])
    if authentication
      #update and return data
      authentication.user.image_url = user_info['image']
      authentication.user.save
      authentication.user
    else 
      user = signed_in_resource || find_by_email(user_info['email']) ||
             create(:name => user_info['name'],
                      :email => user_info['email'], 
                      :password => Devise.friendly_token[0,20],
                      :image_url => user_info['image'])
      user.authentications.create(
        :uid => access_token['uid'],
        :provider => access_token['provider'],
        :credentials => access_token['credentials']
      )
      user
    end
  end

  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    user_info = access_token['user_info']

    authentication = Authentication.find_by_uid_and_provider(access_token['uid'],access_token['provider'])
    if authentication
      #update and return data
      authentication.user.image_url = user_info['image']
      authentication.user.save
      authentication.user
    elsif signed_in_resource 
      signed_in_resource.authentications.create(
        :uid => access_token['uid'],
        :provider => access_token['provider'],
        :credentials => access_token['credentials']
      )
      signed_in_resource.image_url = user_info["image_url"]
      signed_in_resource.save 
      signed_in_resource
    end
  end
end
