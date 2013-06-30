class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    dashboard_path(1)
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_lead_path
  end
end
