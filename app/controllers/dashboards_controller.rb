class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  
  # /users/1/dashboards
  def index
    @dashboard = Dashboard.new(User.find(params[:user_id]))    
  end
  
end