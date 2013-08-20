class MeasurementsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET users/1/dimensions/1/measurements
  def index
    @measurements = Measurement.where(:dimension_id => current_user.dimensions.map(&:id)).order("updated_at desc").page(params[:page]).per(5)
    
    respond_to do |format|
      format.js
      format.json { render :json => @measurements }
    end
  end
  
  # GET users/1/dimensions/1/measurements/new
  # GET users/1/measurements/new
  def new
    @measurement = Measurement.new    
    @dimensions = current_user.dimensions.order("created_at desc").limit(5)
    @return_path = @custom_root_path     
    gon.is_step2 = params[:dimension_id].present?     
    gon.user_id = current_user.id
    if params[:dimension_id].present?
      gon.dimension_id = params[:dimension_id].to_i 
      @return_path = user_dimension_path(current_user, params[:dimension_id].to_i)
    end        
  end
  
  # POST users/1/dimensions/1/measurements
  def create
    @measurement = Measurement.new(params[:measurement])
    @measurement.dimension_id = params[:dimension_id]
    @dimensions = current_user.dimensions

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to @custom_root_path, notice: "OK" }
        format.json { render json: @measurement, status: :created, location: new_user_measurement_url(current_user) }
      else 
        # Establecemos las variables javascript necesarias para saltar al paso 2 del formulario si es necesario
        if @measurement.errors.any?
          gon.is_step2 = true
          gon.dimension_id = params[:dimension_id].to_i
          gon.user_id = current_user.id
        end
        format.html { render "new" }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end
  
end