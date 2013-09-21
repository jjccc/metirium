class DimensionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :get_referer
  
  # GET /users/1/dimensions
  def index
    @has_paginator = false
    if params[:term].present?
      # Búsqueda predictiva de variables
      @dimensions = current_user.dimensions.where('name collate LATIN1_GENERAL_CI like ?', "%#{params[:term]}%").order(:name)
    else
      # Gestión de variables
      @dimensions = current_user.dimensions.order("updated_at desc").page(params[:page]).per(4)
      @has_paginator = @dimensions.total_pages > 1  
    end            
    
    respond_to do |format|      
      format.js
      format.json { render :json => @dimensions.map{ |x| {:id => x.id, :label => x.name, :value => x.name} }.as_json }
      format.html
    end
  end
  
  # GET users/1/dimensions/new
  def new
    @facts = Fact.order(:id)
    @dimension = current_user.dimensions.build       
  end
  
  # GET /users/1/dimensions/1/edit
  def edit
    begin
      @facts = Fact.order(:id)
      @dimension = Dimension.find(params[:id])
    rescue ActiveRecord::RecordNotFound      
      respond_to do |format|
        format.html { redirect_to @custom_root_path }
        format.json { render json: @dimension.errors, status: :unprocessable_entity } 
      end
    end
  end
  
  # PUT users/1/dimensions/1
  def update    
    begin
      @facts = Fact.order(:id)
      @dimension = Dimension.find(params[:id])
      
      if params[:is_public].present?
        @dimension.is_public = params[:is_public]
        result = @dimension.save
      else
        result = @dimension.update_attributes(params[:dimension])
      end
  
      respond_to do |format|
        if result
          format.html { redirect_to params[:dimension][:return_path], notice: 'Se ha guardado la variable correctamente.' }
          format.json { head :ok }
          format.js
        else
          format.html { render action: "edit" }
          format.json { render json: @dimension.errors, status: :unprocessable_entity }
          format.js
        end
      end
    rescue ActiveRecord::RecordNotFound      
      respond_to do |format|
        format.html { redirect_to @custom_root_path }
        format.json { render json: @dimension.errors, status: :unprocessable_entity } 
      end
    end      
  end
  
  # POST users/1/dimensions
  def create
    @facts = Fact.order(:id)
    @dimension = Dimension.new(params[:dimension])

    respond_to do |format|
      if @dimension.save
        format.html { redirect_to params[:dimension][:return_path], notice: "OK" }
        format.json { render json: @dimension, status: :created, location: new_user_dimension_url(current_user) }
      else              
        format.html { render "new" }
        format.json { render json: @dimension.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET users/1/dimensions/1
  # GET dimensions/1
  def show
    begin
      @dimension = Dimension.find(params[:id])        
      if @dimension.is_public || authenticate_user!             
        @measurements = @dimension.measurements
        @measurements_count = @measurements.count
        @heatmap = Heatmap.new(@measurements) if @dimension.is_spot?
        @highchart = Highchart.new(@measurements) if @dimension.is_quantified?
        
        gon.user_id = params[:user_id].present? ? current_user.id : nil
        gon.dimension_id = @dimension.id 
        gon.url = dimension_url(@dimension)
        gon.tweet = @dimension.name
        
        respond_to do |format|
          format.html { render "show" }
          format.json { render json: @dimension } 
        end
      else
        respond_to do |format|
          format.html { redirect_to @custom_root_path }
          format.json { render json: Dimension.new, status: :unprocessable_entity } 
        end 
      end         
    rescue ActiveRecord::RecordNotFound      
      respond_to do |format|
        format.html { redirect_to @custom_root_path }
        format.json { render json: @dimension.errors, status: :unprocessable_entity } 
      end
    end 
  end
  
  # DELETE users/1/dimensions/1
  def destroy
    begin
      @dimension = Dimension.find(params[:id])  
      @dimension.destroy  
  
      respond_to do |format|  
        format.html { redirect_to @return_path }          
      end 
    rescue ActiveRecord::RecordNotFound      
      respond_to do |format|
        format.html { redirect_to @custom_root_path }
        format.json { render json: @dimension.errors, status: :unprocessable_entity } 
      end
    end  
  end 
  
  # DELETE users/1/dimensions/1/measurements/destroy
  def destroy_measurements
    begin
      @dimension = Dimension.find(params[:id])  
      @dimension.measurements.clear
  
      respond_to do |format|  
        format.html { redirect_to dimension_path(@dimension) }  
        format.json { render json: @dimension } 
      end 
    rescue ActiveRecord::RecordNotFound      
      respond_to do |format|
        format.html { redirect_to @custom_root_path }
        format.json { render json: @dimension.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def get_referer
    @return_path = URI(request.referer).path
  end
  
end