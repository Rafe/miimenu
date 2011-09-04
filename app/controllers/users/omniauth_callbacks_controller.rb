class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  def facebook 
    @user = User.find_for_facebook_oauth(env["omniauth.auth"],current_user)
    if @user.persisted?
      flash[:notice] = "login with facebook success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]["user_info"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    #use user_name for authentication sample, need to change the authentication to other
    session["devise.twitter_data"] = env["omniauth.auth"]["user_info"]
    redirect_to new_user_registration_url
    #@user = User.find_for_twitter_oauth(env["omniauth.auth"],current_user)
    #if @user.persisted?
    #  flash[:notice] = "login with twitter success"
    #  sign_in_and_redirect @user, :event => :authentication
    #else
    #  session["devise.twitter_data"] = env["omniauth.auth"]["user_info"]
    #end
  end
end
