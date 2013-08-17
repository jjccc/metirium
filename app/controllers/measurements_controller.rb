class MeasurementsController < ApplicationController
  before_filter :authenticate_user!
  
  # users/1/measurements
  def index
    @measurements = Measurement.where(:dimension_id => current_user.dimensions.map(&:id)).order("updated_at desc").page(params[:page]).per(5)
    
    respond_to do |format|
      format.js
      format.json { render :json => @measurements }
    end
  end
  
  # users/1/measurements/new
  def new
    @measurement = Measurement.new
    
    @facts = Fact.order(:id)
  end
  
end