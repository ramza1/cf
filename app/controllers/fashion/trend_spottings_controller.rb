class Fashion::TrendSpottingsController < ApplicationController
  load_and_authorize_resource
  def index
    @trend_spottings = TrendSpotting.accessible_by(current_ability).recent.includes(:photos).page(params[:page]).per_page(27)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trend_spottings }
    end
  end

  # GET /trend_spottings/1
  # GET /trend_spottings/1.json
  def show
    @trend_spotting = TrendSpotting.find(params[:id])
    @photos = @trend_spotting.photos

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trend_spotting }
    end
  end

  # GET /trend_spottings/new
  # GET /trend_spottings/new.json
  def new
    @trend_spotting = TrendSpotting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trend_spotting }
    end
  end

  # GET /trend_spottings/1/edit
  def edit
    @trend_spotting = TrendSpotting.find(params[:id])
  end

  # POST /trend_spottings
  # POST /trend_spottings.json
  def create
    @trend_spotting = TrendSpotting.new(params[:trend_spotting])

    respond_to do |format|
      if @trend_spotting.save
        format.html { redirect_to @trend_spotting, notice: 'Trend spotting was successfully created.' }
        format.json { render json: @trend_spotting, status: :created, location: @trend_spotting }
      else
        format.html { render action: "new", layout: "forms" }
        format.json { render json: @trend_spotting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trend_spottings/1
  # PUT /trend_spottings/1.json
  def update
    @trend_spotting = TrendSpotting.find(params[:id])

    respond_to do |format|
      if @trend_spotting.update_attributes(params[:trend_spotting])
        format.html { redirect_to @trend_spotting, notice: 'Trend spotting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @trend_spotting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trend_spottings/1
  # DELETE /trend_spottings/1.json
  def destroy
    @trend_spotting = TrendSpotting.find(params[:id])
    @trend_spotting.destroy

    respond_to do |format|
      format.html { redirect_to trend_spottings_url }
      format.json { head :no_content }
    end
  end
end
