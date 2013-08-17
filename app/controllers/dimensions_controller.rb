class DimensionsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /users/1/dimensions
  def index
    @dimensions = current_user.dimensions.order("updated_at desc").page(params[:page]).per(5)
      
    respond_to do |format|
      format.js
      format.json { render :json => @dimensions }
    end
  end
  
  # GET users/1/dimensions/new
  def new
    @facts = Fact.order(:id)
    @dimension = current_user.dimensions.build    
  end
  
  # POST users/1/dimensions
  def create
    @facts = Fact.order(:id)
    @dimension = Dimension.new(params[:dimension])

    respond_to do |format|
      if @dimension.save
        format.html { redirect_to @custom_root_path, notice: "OK" }
        format.json { render json: @dimension, status: :created, location: new_user_dimension_url(current_user) }
      else        
        format.html { render "new" }
        format.json { render json: @dimension.errors, status: :unprocessable_entity }
      end
    end
  end
  
end