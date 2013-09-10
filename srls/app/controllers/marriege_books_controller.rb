class MarriegeBooksController < ApplicationController
  # GET /marriege_books
  # GET /marriege_books.json
  def index
    @marriege_books = MarriegeBook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marriege_books }
    end
  end

  # GET /marriege_books/1
  # GET /marriege_books/1.json
  def show
    @marriege_book = MarriegeBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marriege_book }
    end
  end

  # GET /marriege_books/new
  # GET /marriege_books/new.json
  def new
    @marriege_book = MarriegeBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marriege_book }
    end
  end

  # GET /marriege_books/1/edit
  def edit
    @marriege_book = MarriegeBook.find(params[:id])
  end

  # POST /marriege_books
  # POST /marriege_books.json
  def create
    @marriege_book = MarriegeBook.new(params[:marriege_book])

    respond_to do |format|
      if @marriege_book.save
        format.html { redirect_to @marriege_book, notice: 'Marriege book was successfully created.' }
        format.json { render json: @marriege_book, status: :created, location: @marriege_book }
      else
        format.html { render action: "new" }
        format.json { render json: @marriege_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marriege_books/1
  # PUT /marriege_books/1.json
  def update
    @marriege_book = MarriegeBook.find(params[:id])

    respond_to do |format|
      if @marriege_book.update_attributes(params[:marriege_book])
        format.html { redirect_to @marriege_book, notice: 'Marriege book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marriege_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marriege_books/1
  # DELETE /marriege_books/1.json
  def destroy
    @marriege_book = MarriegeBook.find(params[:id])
    @marriege_book.destroy

    respond_to do |format|
      format.html { redirect_to marriege_books_url }
      format.json { head :no_content }
    end
  end
end
