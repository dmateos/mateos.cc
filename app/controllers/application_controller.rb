class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user
  end

  def user_admin?
    current_user.admin? if user_signed_in?
  end

  helper_method :current_user, :user_signed_in?, :user_admin?

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private  
  def user_not_authorized
    flash[:alert] = "not authorized to perform that action"
    redirect_to(request.referrer || root_path)
  end
end
