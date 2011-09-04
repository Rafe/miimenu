class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  
  protected
  
  def set_locale
    if params[:locale] && ["en", "zh_tw"].include?( params[:locale] )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end
  
  def render_not_found
    redirect_to "/404.html"
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
