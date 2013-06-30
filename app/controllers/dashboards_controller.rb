class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  
  # /dashboards/1
  def show
    @dashboard = Dashboard.new(current_user)
  end
  
end