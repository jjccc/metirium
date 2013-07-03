class DimensionsController < ApplicationController
  before_filter :authenticate_user!
  
  # /dimensions
  def index
    page = params[:page].present? ? params[:page].to_i : 1
    size = params[:size].present? ? params[:size].to_i : 5
    from = (page - 1) * size
    to = from + size - 1
    @dimensions = current_user.dimensions.order("updated_at desc")[from..to]  
      
    respond_to do |format|
      format.json { render :json => @dimensions }
    end
  end
  
end