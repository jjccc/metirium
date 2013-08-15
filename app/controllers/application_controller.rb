class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale, :set_root
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def set_root
    @custom_root_path = root_path
    @custom_root_path = user_dashboards_path(current_user) if user_signed_in?
  end
  
  def after_sign_in_path_for(resource_or_scope)
    user_dashboards_path(current_user)
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_lead_path
  end
end
