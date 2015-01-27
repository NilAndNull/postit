module ApplicationHelper
  
  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end 
  end

  def require_authentication
    if !logged_in?
      flash[:danger] = "Authentication is needed. Please log in."
      redirect_to login_url
    end
  end

end
