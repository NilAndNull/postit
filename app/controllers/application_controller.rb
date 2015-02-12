class ApplicationController < ActionController::Base
  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Set timezone defined to each user or use the default timezone
  around_action :set_timezone, if: :current_user

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

  private

    def set_timezone
      if logged_in? and current_user.time_zone
        Time.use_zone(current_user.time_zone) { yield }
      else
        yield
      end
    end

end
