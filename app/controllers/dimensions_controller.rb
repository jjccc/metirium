class DimensionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
  # GET /users/1/dimensions
  def index   
    #@dimensions = current_user.dimensions.order("updated_at desc").page(params[:page]).per(5)
    @dimensions = current_user.dimensions.where('name collate LATIN1_GENERAL_CI like ?', "%#{params[:term]}%").order(:name)
    respond_to do |format|
      format.js
      format.json { render :json => @dimensions.map{ |x| {:id => x.id, :label => x.name, :value => x.name} }.as_json }
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
        format.json { render json: Dimension.new, status: :unprocessable_entity } 
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
          format.html { redirect_to user_dimension_path(current_user, @dimension), notice: 'Se ha guardado el evento correctamente.' }
          format.json { head :ok }
          format.js
        else
          format.html { render action: "edit" }
          format.json { render json: @event.errors, status: :unprocessable_entity }
          format.js
        end
      end
    rescue ActiveRecord::RecordNotFound      
      respond_to do |format|
        format.html { redirect_to @custom_root_path }
        format.json { render json: Dimension.new, status: :unprocessable_entity } 
      end
    end      
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
        format.json { render json: Dimension.new, status: :unprocessable_entity } 
      end
    end 
  end
  
  # DELETE users/1/dimensions/1
  def destroy
    begin
      @dimension = Dimension.find(params[:id])  
      @dimension.destroy  
  
      respond_to do |format|  
        format.html { redirect_to @custom_root_path }  
        format.js   { render :nothing => true }  
      end 
    rescue ActiveRecord::RecordNotFound      
      respond_to do |format|
        format.html { redirect_to @custom_root_path }
        format.json { render json: Dimension.new, status: :unprocessable_entity } 
      end
    end  
  end 
  
end