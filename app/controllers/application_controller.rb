class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  protected

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
