class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def require_authentication
    if !logged_in?
      flash[:danger] = "Authentication is needed. Please log in."
      redirect_to login_url
    end
  end

  def require_admin
    if !logged_in? or current_user.role != User::Role::ADMIN
      flash[:danger] = "You don't have permissions to perform this operation."
      redirect_to root_url
    end
  end

end
