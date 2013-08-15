class DimensionsController < ApplicationController
  before_filter :authenticate_user!
  
  # /users/1/dimensions
  def index
    @dimensions = current_user.dimensions.order("updated_at desc").page(params[:page]).per(5)
      
    respond_to do |format|
      format.js
      format.json { render :json => @dimensions }
    end
  end
  
  # users/1/dimensions/new
  def new
    @dimension = current_user.dimensions.build
    @facts = Fact.order(:id)
  end
  
end