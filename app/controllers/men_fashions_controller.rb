class MenFashionsController < ApplicationController
  load_and_authorize_resource
  def index
    @men_fashions = MenFashion.accessible_by(current_ability).recent.page(params[:page]).per_page(27)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @men_fashions }
    end
  end

  # GET /men_fashions/1
  # GET /men_fashions/1.json
  def show
    @men_fashion = MenFashion.find(params[:id])
    @photos = @men_fashion.photos
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @men_fashion }
    end
  end

  # GET /men_fashions/new
  # GET /men_fashions/new.json
  def new
    @men_fashion = MenFashion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @men_fashion }
    end
  end

  # GET /men_fashions/1/edit
  def edit
    @men_fashion = MenFashion.find(params[:id])
  end

  # POST /men_fashions
  # POST /men_fashions.json
  def create
    @men_fashion = MenFashion.new(params[:men_fashion])

    respond_to do |format|
      if @men_fashion.save
        format.html { redirect_to @men_fashion, notice: 'Men fashion was successfully created.' }
        format.json { render json: @men_fashion, status: :created, location: @men_fashion }
      else
        format.html { render action: "new", layout: "forms" }
        format.json { render json: @men_fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /men_fashions/1
  # PUT /men_fashions/1.json
  def update
    @men_fashion = MenFashion.find(params[:id])

    respond_to do |format|
      if @men_fashion.update_attributes(params[:men_fashion])
        format.html { redirect_to @men_fashion, notice: 'Men fashion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @men_fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /men_fashions/1
  # DELETE /men_fashions/1.json
  def destroy
    @men_fashion = MenFashion.find(params[:id])
    @men_fashion.destroy

    respond_to do |format|
      format.html { redirect_to men_fashions_url }
      format.json { head :no_content }
    end
  end
end
