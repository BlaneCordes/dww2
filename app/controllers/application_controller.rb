class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  protect_from_forgery

  def after_sign_in_path_for(resources)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resources)
    root_path
  end

  protected

  def admin?
    if current_user && current_user.email == "admin@example.com"
      true
    else
      false
    end
  end
  
  helper_method :admin?

  def authorize
    unless admin?
      flash[:error] = "Unauthorized Access"
      redirect_to user_path(current_user)
    end
  end

end
