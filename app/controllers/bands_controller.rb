class BandsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @bands = current_user.bands.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bands }
    end
  end

  def new
    @band = current_user.bands.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @band }
    end
  end

  def create
    @band = current_user.bands.new(params[:band])

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
    @band = current_user.bands.find(params[:id])
    @band.destroy

    respond_to do |format|
      format.html { redirect_to bands_url }
      format.json { head :ok }
    end
  end
end
