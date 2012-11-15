class FashionJuriesController < ApplicationController
  load_and_authorize_resource
  def index
    @fashion_juries = FashionJury.accessible_by(current_ability).recent.page(params[:page]).per_page(27)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fashion_juries }
      format.js
    end
  end

  # GET /fashion_juries/1
  # GET /fashion_juries/1.json
  def show
    @fashion_jury = FashionJury.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end

  # GET /fashion_juries/new
  # GET /fashion_juries/new.json
  def new
    @fashion_jury = FashionJury.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # GET /fashion_juries/1/edit
  def edit
    @fashion_jury = FashionJury.find(params[:id])
  end

  # POST /fashion_juries
  # POST /fashion_juries.json
  def create
    @fashion_jury = FashionJury.new(params[:fashion_jury])

    respond_to do |format|
      if @fashion_jury.save
        format.html { redirect_to @fashion_jury, notice: 'Fashion jury was successfully created.' }
        format.json { render json: @fashion_jury, status: :created, location: @fashion_jury }
      else
        format.html { render action: "new", layout: "forms" }
        format.json { render json: @fashion_jury.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fashion_juries/1
  # PUT /fashion_juries/1.json
  def update
    @fashion_jury = FashionJury.find(params[:id])

    respond_to do |format|
      if @fashion_jury.update_attributes(params[:fashion_jury])
        format.html { redirect_to @fashion_jury, notice: 'Fashion jury was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @fashion_jury.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fashion_juries/1
  # DELETE /fashion_juries/1.json
  def destroy
    @fashion_jury = FashionJury.find(params[:id])
    @fashion_jury.destroy

    respond_to do |format|
      format.html { redirect_to fashion_juries_url }
      format.json { head :no_content }
    end
  end
end
