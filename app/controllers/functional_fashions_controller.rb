class FunctionalFashionsController < ApplicationController
  load_and_authorize_resource
  def index
    @functional_fashions = FunctionalFashion.accessible_by(current_ability).recent.includes(:functional_fashion_designer).page(params[:page]).per_page(27)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @functional_fashions }
    end
  end

  # GET /functional_fashions/1
  # GET /functional_fashions/1.json
  def show
    @functional_fashion = FunctionalFashion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @functional_fashion }
    end
  end

  # GET /functional_fashions/new
  # GET /functional_fashions/new.json
  def new
    @functional_fashion = FunctionalFashion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @functional_fashion }
    end
  end

  # GET /functional_fashions/1/edit
  def edit
    @functional_fashion = FunctionalFashion.find(params[:id])
  end

  # POST /functional_fashions
  # POST /functional_fashions.json
  def create
    @functional_fashion = FunctionalFashion.new(params[:functional_fashion])

    respond_to do |format|
      if @functional_fashion.save
        format.html { redirect_to @functional_fashion, notice: 'Functional fashion was successfully created.' }
        format.json { render json: @functional_fashion, status: :created, location: @functional_fashion }
      else
        format.html { render action: "new", layout: "forms" }
        format.json { render json: @functional_fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /functional_fashions/1
  # PUT /functional_fashions/1.json
  def update
    @functional_fashion = FunctionalFashion.find(params[:id])

    respond_to do |format|
      if @functional_fashion.update_attributes(params[:functional_fashion])
        format.html { redirect_to @functional_fashion, notice: 'Functional fashion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @functional_fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functional_fashions/1
  # DELETE /functional_fashions/1.json
  def destroy
    @functional_fashion = FunctionalFashion.find(params[:id])
    @functional_fashion.destroy

    respond_to do |format|
      format.html { redirect_to functional_fashions_url }
      format.json { head :no_content }
    end
  end



  def paginate

  end
end
