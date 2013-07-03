class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  # /users/1
  def show
    @dashboard = Dashboard.new(current_user)
  end
  
end