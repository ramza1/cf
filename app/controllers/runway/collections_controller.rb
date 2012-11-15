class Runway::CollectionsController < ApplicationController
  before_filter :setup, :only => [:index, :show]
  load_and_authorize_resource
  def index
    unless @runway_collections.empty?
      @first_group = @runway_collections.first.photos
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @runway_collections }
    end
  end

  # GET /runway/collections/1
  # GET /runway/collections/1.json
  def show
    @runway_collection = Runway::Collection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @runway_collection }
    end
  end

  # GET /runway/collections/new
  # GET /runway/collections/new.json
  def new
    @runway_collection = Runway::Collection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @runway_collection }
    end
  end

  # GET /runway/collections/1/edit
  def edit
    @runway_collection = Runway::Collection.find(params[:id])
  end

  # POST /runway/collections
  # POST /runway/collections.json
  def create
    @runway_collection = Runway::Collection.new(params[:runway_collection])

    respond_to do |format|
      if @runway_collection.save
        format.html { redirect_to @runway_collection, notice: 'Collection was successfully created.' }
        format.json { render json: @runway_collection, status: :created, location: @runway_collection }
      else
        format.html { render action: "new", layout: "forms" }
        format.json { render json: @runway_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /runway/collections/1
  # PUT /runway/collections/1.json
  def update
    @runway_collection = Runway::Collection.find(params[:id])

    respond_to do |format|
      if @runway_collection.update_attributes(params[:runway_collection])
        format.html { redirect_to @runway_collection, notice: 'Collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @runway_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runway/collections/1
  # DELETE /runway/collections/1.json
  def destroy
    @runway_collection = Runway::Collection.find(params[:id])
    @runway_collection.destroy

    respond_to do |format|
      format.html { redirect_to runway_collections_url }
      format.json { head :no_content }
    end
  end

  protected

  def setup
    @search =  Runway::Collection.accessible_by(current_ability).search(params[:q])
    @runway_collections = @search.result
    @year = Runway::Year.order("name desc")
  end
end


