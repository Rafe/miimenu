class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  def facebook 
    omniauth = env["omniauth.auth"]
    @user = User.find_for_facebook_oauth(omniauth,current_user)
    if @user && @user.persisted?
      flash[:notice] = "login with facebook success"
      sign_in_and_redirect @user, :event => :authentication
    else
      #trim the omniauth data to fit in session cookie
      session["devise.facebook_data"] = omniauth.except('extra')
      redirect_to new_user_registration_url
    end
  end

  def twitter
    omniauth = env["omniauth.auth"]
    @user = User.find_for_twitter_oauth(env["omniauth.auth"],current_user)
    if @user && @user.persisted?
      flash[:notice] = "login with twitter success"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = "please provide your email address for twitter authentication"
      session["devise.twitter_data"] = omniauth.except('extra')
      redirect_to new_user_registration_url
    end
  end
end
