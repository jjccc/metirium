class MeasurementsController < ApplicationController
  before_filter :authenticate_user!
  
  # /measurements
  def index
    @measurements = Measurement.where(:dimension_id => current_user.dimensions.map(&:id)).order("updated_at desc").page(params[:page]).per(5)
    
    respond_to do |format|
      format.json { render :json => @measurements }
    end
  end
  
end