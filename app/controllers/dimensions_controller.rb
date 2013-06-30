class DimensionsController < ApplicationController
  before_filter :authenticate_user!
  
  # /dimensions
  def index
    @dimensions = Dimension.order("updated_at desc")
    respond_to do |format|
      format.json { render :json => @dimensions }
    end
  end
  
end