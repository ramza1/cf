class Runway::SeasonsController < ApplicationController
  load_and_authorize_resource
  def index
    @runway_seasons = Runway::Season.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @runway_seasons }
    end
  end

  # GET /runway/seasons/1
  # GET /runway/seasons/1.json
  def show
    @runway_season = Runway::Season.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @runway_season }
    end
  end

  # GET /runway/seasons/new
  # GET /runway/seasons/new.json
  def new
    @runway_season = Runway::Season.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @runway_season }
    end
  end

  # GET /runway/seasons/1/edit
  def edit
    @runway_season = Runway::Season.find(params[:id])
  end

  # POST /runway/seasons
  # POST /runway/seasons.json
  def create
    @runway_season = Runway::Season.new(params[:runway_season])

    respond_to do |format|
      if @runway_season.save
        format.html { redirect_to @runway_season, notice: 'Season was successfully created.' }
        format.json { render json: @runway_season, status: :created, location: @runway_season }
      else
        format.html { render action: "new", layout: "forms" }
        format.json { render json: @runway_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /runway/seasons/1
  # PUT /runway/seasons/1.json
  def update
    @runway_season = Runway::Season.find(params[:id])

    respond_to do |format|
      if @runway_season.update_attributes(params[:runway_season])
        format.html { redirect_to @runway_season, notice: 'Season was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @runway_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runway/seasons/1
  # DELETE /runway/seasons/1.json
  def destroy
    @runway_season = Runway::Season.find(params[:id])
    @runway_season.destroy

    respond_to do |format|
      format.html { redirect_to runway_seasons_url }
      format.json { head :no_content }
    end
  end
end
