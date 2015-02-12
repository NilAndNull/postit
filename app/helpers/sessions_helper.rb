module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find_by(id: user_id) unless user_id.nil?
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def isAdmin?
    current_user.role == User::Role::ADMIN
  end


end
