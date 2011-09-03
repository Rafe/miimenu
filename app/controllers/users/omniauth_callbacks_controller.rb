class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  def facebook 
    @user = User.find_for_facebook_oauth(env["omniauth.auth"],current_user)

    if @user.persisted?
      flash[:notice] = "login with facebook success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    @user = User.first
    #auth_data = env["mmniauth.auth"]["extra"]["user_info"]

    #user = User.find_by_name(auth_data["user_info"]["name"])
    #render :text => env["omniauth.auth"] ,:format => :yaml
    sign_in_and_redirect @user, :event => :authentication
  end
end
