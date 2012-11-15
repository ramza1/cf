class FunctionalFashionDesignersController < ApplicationController
  load_and_authorize_resource
  def index
    @functional_fashion_designers = FunctionalFashionDesigner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @functional_fashion_designers }
    end
  end

  # GET /functional_fashion_designers/1
  # GET /functional_fashion_designers/1.json
  def show
    @functional_fashion_designer = FunctionalFashionDesigner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @functional_fashion_designer }
    end
  end

  # GET /functional_fashion_designers/new
  # GET /functional_fashion_designers/new.json
  def new
    @functional_fashion_designer = FunctionalFashionDesigner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @functional_fashion_designer }
    end
  end

  # GET /functional_fashion_designers/1/edit
  def edit
    @functional_fashion_designer = FunctionalFashionDesigner.find(params[:id])
  end

  # POST /functional_fashion_designers
  # POST /functional_fashion_designers.json
  def create
    @functional_fashion_designer = FunctionalFashionDesigner.new(params[:functional_fashion_designer])

    respond_to do |format|
      if @functional_fashion_designer.save
        format.html { redirect_to @functional_fashion_designer, notice: 'Functional fashion designer was successfully created.' }
        format.json { render json: @functional_fashion_designer, status: :created, location: @functional_fashion_designer }
      else
        format.html { render action: "new", layout: "forms" }
        format.json { render json: @functional_fashion_designer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /functional_fashion_designers/1
  # PUT /functional_fashion_designers/1.json
  def update
    @functional_fashion_designer = FunctionalFashionDesigner.find(params[:id])

    respond_to do |format|
      if @functional_fashion_designer.update_attributes(params[:functional_fashion_designer])
        format.html { redirect_to @functional_fashion_designer, notice: 'Functional fashion designer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @functional_fashion_designer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functional_fashion_designers/1
  # DELETE /functional_fashion_designers/1.json
  def destroy
    @functional_fashion_designer = FunctionalFashionDesigner.find(params[:id])
    @functional_fashion_designer.destroy

    respond_to do |format|
      format.html { redirect_to functional_fashion_designers_url }
      format.json { head :no_content }
    end
  end
end
