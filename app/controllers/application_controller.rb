class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
