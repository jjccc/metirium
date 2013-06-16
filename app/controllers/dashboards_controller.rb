class DashboardsController < ApplicationController
  
  # /dashboards/1
  def show
    @dashboard = Dashboard.new
  end
  
end