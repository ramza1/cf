class RedcarpetsController < ApplicationController
  load_and_authorize_resource
  def index
    @redcarpets = Redcarpet.accessible_by(current_ability).recent.includes(:photos).page(params[:page]).per_page(27)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @redcarpets }
    end
  end

  # GET /redcarpets/1
  # GET /redcarpets/1.json
  def show
    @redcarpet = Redcarpet.find(params[:id])
    @photos = @redcarpet.photos

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @redcarpet }
    end
  end

  # GET /redcarpets/new
  # GET /redcarpets/new.json
  def new
    @redcarpet = Redcarpet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @redcarpet }
    end
  end

  # GET /redcarpets/1/edit
  def edit
    @redcarpet = Redcarpet.find(params[:id])
  end

  # POST /redcarpets
  # POST /redcarpets.json
  def create
    @redcarpet = Redcarpet.new(params[:redcarpet])

    respond_to do |format|
      if @redcarpet.save
        format.html { redirect_to @redcarpet, notice: 'Redcarpet was successfully created.' }
        format.json { render json: @redcarpet, status: :created, location: @redcarpet }
      else
        format.html { render action: "new", layout: "forms"}
        format.json { render json: @redcarpet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /redcarpets/1
  # PUT /redcarpets/1.json
  def update
    @redcarpet = Redcarpet.find(params[:id])

    respond_to do |format|
      if @redcarpet.update_attributes(params[:redcarpet])
        format.html { redirect_to @redcarpet, notice: 'Redcarpet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @redcarpet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redcarpets/1
  # DELETE /redcarpets/1.json
  def destroy
    @redcarpet = Redcarpet.find(params[:id])
    @redcarpet.destroy

    respond_to do |format|
      format.html { redirect_to redcarpets_url }
      format.json { head :no_content }
    end
  end
end
