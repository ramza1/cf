class PhotosController < ApplicationController
  before_filter :setup, :only => [:create, :index]
  load_and_authorize_resource
  def index
    @photos = @parent.photos.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = @parent.photos.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @parent, notice: 'Photo was successfully created.' }
        format.js
      else
        format.html { render action: "new", layout: "forms" }
        format.js {render :template => "photos/error.js"}
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo.photoable, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to :back}

      format.json { head :no_content }
    end
  end

  protected

  def parent; @trend_spottings || @redcarpet || @runway_collection || @men_fashion || @look_book || nil end

  def setup
    @trend_spottings = TrendSpotting.find(params[:trend_spotting_id]) unless params[:trend_spotting_id].blank?
    @redcarpet = Redcarpet.find(params[:redcarpet_id]) unless params[:redcarpet_id].blank?
    @look_book = LookBook.find(params[:look_book_id]) unless params[:look_book_id].blank?
    @men_fashion = MenFashion.find(params[:men_fashion_id]) unless params[:men_fashion_id].blank?
    @runway_collection = Runway::Collection.find(params[:collection_id]) unless params[:collection_id].blank?
    @parent = parent
  end
end
