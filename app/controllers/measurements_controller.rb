class MeasurementsController < ApplicationController
  before_filter :authenticate_user!
  
  # /measurements
  def index
    @measurements = Measurement.order("updated_at desc")
    respond_to do |format|
      format.json { render :json => @measurements }
    end
  end
  
end