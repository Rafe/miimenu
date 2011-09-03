class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  def facebook 
    @user = User.find_for_facebook_oauth(env["omniauth.auth"],current_user)
    render :text => env["omniauth.auth"]
    if @user.persisted?
      flash[:notice] = "login with facebook success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    user_hash = env["omniauth.auth"]["extra"]["user_hash"]
    #use user_name for authentication sample, need to change the authentication to other
    @user = User.find_by_name(user_hash["name"].to_s)
    if @user.persisted?
      flash[:notice] = "login with twitter success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
