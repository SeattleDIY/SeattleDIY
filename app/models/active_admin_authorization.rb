class ActiveAdminAuthorization < ActiveAdmin::AuthorizationAdapter
  def authorized?(action, subject = nil)
    return true if user.role?("staff")
    false
  end
end
