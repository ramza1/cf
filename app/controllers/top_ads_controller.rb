class TopAdsController < ApplicationController
  load_and_authorize_resource
  def index
    @top_ads = TopAd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @top_ads }
    end
  end

  # GET /top_ads/1
  # GET /top_ads/1.json
  def show
    @top_ad = TopAd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @top_ad }
    end
  end

  # GET /top_ads/new
  # GET /top_ads/new.json
  def new
    @top_ad = TopAd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @top_ad }
    end
  end

  # GET /top_ads/1/edit
  def edit
    @top_ad = TopAd.find(params[:id])
  end

  # POST /top_ads
  # POST /top_ads.json
  def create
    @top_ad = TopAd.new(params[:top_ad])

    respond_to do |format|
      if @top_ad.save
        format.html { redirect_to @top_ad, notice: 'Top ad was successfully created.' }
        format.json { render json: @top_ad, status: :created, location: @top_ad }
      else
        format.html { render action: "new", :layout => "forms" }
        format.json { render json: @top_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /top_ads/1
  # PUT /top_ads/1.json
  def update
    @top_ad = TopAd.find(params[:id])

    respond_to do |format|
      if @top_ad.update_attributes(params[:top_ad])
        format.html { redirect_to @top_ad, notice: 'Top ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", :layout => "forms" }
        format.json { render json: @top_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top_ads/1
  # DELETE /top_ads/1.json
  def destroy
    @top_ad = TopAd.find(params[:id])
    @top_ad.destroy

    respond_to do |format|
      format.html { redirect_to top_ads_url }
      format.json { head :no_content }
    end
  end
end
