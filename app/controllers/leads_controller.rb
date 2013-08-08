# encoding: utf-8
class LeadsController < ApplicationController

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # POST /leads
  def create
    @lead = Lead.new(params[:lead])

    respond_to do |format|
      if @lead.save
        LeadMailer.welcome_mail(@lead).deliver
        
        format.html { redirect_to root_path, notice: "OK" }
        format.json { render json: @lead, status: :created, location: new_lead_url }
      else
        format.html { render "new" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

end
