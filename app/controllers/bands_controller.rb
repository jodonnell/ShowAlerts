class BandsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @bands = Band.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bands }
    end
  end

  def new
    @band = Band.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @band }
    end
  end

  def create
    @band = Band.new(params[:band])

    respond_to do |format|
      if @band.save
        format.html { redirect_to bands_url, notice: 'Band was successfully created.' }
        format.json { render json: @band, status: :created, location: @band }
      else
        format.html { render action: "new" }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    respond_to do |format|
      format.html { redirect_to bands_url }
      format.json { head :ok }
    end
  end
end
