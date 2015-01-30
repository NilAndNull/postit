module UsersHelper

  def active_tab
    if session[:voteable_type].nil?
      return 'Post'
    elsif session[:voteable_type] == 'Post'
      return 'Post'
    else
      return 'Comment'
    end
  end

end
