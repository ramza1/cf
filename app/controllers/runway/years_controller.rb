class Runway::YearsController < ApplicationController
  load_and_authorize_resource
  def index
    @runway_years = Runway::Year.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @runway_years }
    end
  end

  # GET /runway/years/1
  # GET /runway/years/1.json
  def show
    @runway_year = Runway::Year.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @runway_year }
    end
  end

  # GET /runway/years/new
  # GET /runway/years/new.json
  def new
    @runway_year = Runway::Year.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @runway_year }
    end
  end

  # GET /runway/years/1/edit
  def edit
    @runway_year = Runway::Year.find(params[:id])
  end

  # POST /runway/years
  # POST /runway/years.json
  def create
    @runway_year = Runway::Year.new(params[:runway_year])

    respond_to do |format|
      if @runway_year.save
        format.html { redirect_to @runway_year, notice: 'Year was successfully created.' }
        format.json { render json: @runway_year, status: :created, location: @runway_year }
      else
        format.html { render action: "new", layout: "forms" }
        format.json { render json: @runway_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /runway/years/1
  # PUT /runway/years/1.json
  def update
    @runway_year = Runway::Year.find(params[:id])

    respond_to do |format|
      if @runway_year.update_attributes(params[:runway_year])
        format.html { redirect_to @runway_year, notice: 'Year was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @runway_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runway/years/1
  # DELETE /runway/years/1.json
  def destroy
    @runway_year = Runway::Year.find(params[:id])
    @runway_year.destroy

    respond_to do |format|
      format.html { redirect_to runway_years_url }
      format.json { head :no_content }
    end
  end
end
