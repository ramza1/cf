class RightAdsController < ApplicationController
  load_and_authorize_resource
  def index
    @right_ads = RightAd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @right_ads }
    end
  end

  # GET /right_ads/1
  # GET /right_ads/1.json
  def show
    @right_ad = RightAd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @right_ad }
    end
  end

  # GET /right_ads/new
  # GET /right_ads/new.json
  def new
    @right_ad = RightAd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @right_ad }
    end
  end

  # GET /right_ads/1/edit
  def edit
    @right_ad = RightAd.find(params[:id])
  end

  # POST /right_ads
  # POST /right_ads.json
  def create
    @right_ad = RightAd.new(params[:right_ad])

    respond_to do |format|
      if @right_ad.save
        format.html { redirect_to @right_ad, notice: 'Right ad was successfully created.' }
        format.json { render json: @right_ad, status: :created, location: @right_ad }
      else
        format.html { render action: "new", :layout => "forms" }
        format.json { render json: @right_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /right_ads/1
  # PUT /right_ads/1.json
  def update
    @right_ad = RightAd.find(params[:id])

    respond_to do |format|
      if @right_ad.update_attributes(params[:right_ad])
        format.html { redirect_to @right_ad, notice: 'Right ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", :layout => "forms" }
        format.json { render json: @right_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /right_ads/1
  # DELETE /right_ads/1.json
  def destroy
    @right_ad = RightAd.find(params[:id])
    @right_ad.destroy

    respond_to do |format|
      format.html { redirect_to right_ads_url }
      format.json { head :no_content }
    end
  end
end
