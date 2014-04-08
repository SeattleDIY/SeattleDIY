class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    unless staff?
      flash[:alert] = 'Unauthorized'
      sign_out current_user # harsh toke!
      redirect_to new_user_session_path
    end
  end

  def staff?
    role?("staff")
  end

  def role?(role)
    current_user && current_user.role?(role)
  end
end
