# encoding: utf-8
class LeadsController < ApplicationController

  # GET /leads/new
  def new
    @lead = Lead.new
    redirect_to @custom_root_path if user_signed_in?
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(params[:lead])

    respond_to do |format|      
      if @lead.save
        begin
          LeadMailer.welcome_mail(@lead).deliver
        rescue
        end
        
        format.html { redirect_to root_path, notice: "OK" }
        format.json { render json: @lead, status: :created, location: new_lead_url }
        format.js
      else        
        format.html { render "new" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
        format.js
      end      
    end
  end
  
  #DELETE /leads
  def destroy
    unless params[:digest].blank?
      @leads = Lead.where(:digest => params[:digest])
      @leads.find_each(&:destroy) unless @leads.blank?
    end
  end

end
