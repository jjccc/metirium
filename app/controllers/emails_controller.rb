# encoding: utf-8
class EmailsController < ApplicationController
  #before_filter :authenticate_user!
  layout false
  
  # GET users/1/emails/new
  # GET contact
  def new
    @email = Email.new    
    @email.user_id = params[:user_id] if params[:user_id].present?
    @is_contact = !params[:user_id].present? || params[:contact].present?
    if params[:d].present?
      begin
        dimension = Dimension.find(params[:d].to_i)
        @email.subject = dimension.name
        @email.body = dimension_url(dimension)
      rescue ActiveRecord::RecordNotFound           
      end
    end
    
    respond_to do |format|
      format.html { render @is_contact ? "contact" : "new" }
      format.js
    end
    
  end
  
  # POST users/1/emails.json
  def create
    @email = Email.new(params[:email])    
    
    respond_to do |format|
      if @email.errors.count == 0
        if EmailMailer.post_mail(@email).deliver
          format.json { render json: @email, status: :created }
        else
          @email.errors.add(:deliver, "No se ha podido enviar el correo electrónico.")
          format.json { render json: @email, status: :created }
        end 
      else       
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
      format.js
    end  
  end
  
end