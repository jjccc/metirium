class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def after_sign_in_path_for(resource_or_scope)
    user_path(current_user)
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_lead_path
  end
end
