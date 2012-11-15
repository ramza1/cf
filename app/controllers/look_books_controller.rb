class LookBooksController < ApplicationController
  load_and_authorize_resource
  def index
    @look_books = LookBook.accessible_by(current_ability).recent.page(params[:page]).per_page(27)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @look_books }
    end
  end

  # GET /look_books/1
  # GET /look_books/1.json
  def show
    @look_book = LookBook.find(params[:id])

    @photos = @look_book.photos
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @look_book }
    end
  end

  # GET /look_books/new
  # GET /look_books/new.json
  def new
    @look_book = LookBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @look_book }
    end
  end

  # GET /look_books/1/edit
  def edit
    @look_book = LookBook.find(params[:id])
  end

  # POST /look_books
  # POST /look_books.json
  def create
    @look_book = LookBook.new(params[:look_book])

    respond_to do |format|
      if @look_book.save
        format.html { redirect_to @look_book, notice: 'Look book was successfully created.' }
        format.json { render json: @look_book, status: :created, location: @look_book }
      else
        format.html { render action: "new", layout: "forms" }
        format.json { render json: @look_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /look_books/1
  # PUT /look_books/1.json
  def update
    @look_book = LookBook.find(params[:id])

    respond_to do |format|
      if @look_book.update_attributes(params[:look_book])
        format.html { redirect_to @look_book, notice: 'Look book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "forms" }
        format.json { render json: @look_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /look_books/1
  # DELETE /look_books/1.json
  def destroy
    @look_book = LookBook.find(params[:id])
    @look_book.destroy

    respond_to do |format|
      format.html { redirect_to look_books_url }
      format.json { head :no_content }
    end
  end
end
