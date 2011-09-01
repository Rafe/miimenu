class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
  
  protected
  
  def set_locale
    if params[:locale] && ["en", "zh_tw"].include?( params[:locale] )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end
  
  def render_not_found
    render file: "public/404.html", status: 404
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
