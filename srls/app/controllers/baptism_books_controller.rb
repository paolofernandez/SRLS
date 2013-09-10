class BaptismBooksController < ApplicationController
  # GET /baptism_books
  # GET /baptism_books.json
  def index
    @baptism_books = BaptismBook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @baptism_books }
    end
  end

  # GET /baptism_books/1
  # GET /baptism_books/1.json
  def show
    @baptism_book = BaptismBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @baptism_book }
    end
  end

  # GET /baptism_books/new
  # GET /baptism_books/new.json
  def new
    @baptism_book = BaptismBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @baptism_book }
    end
  end

  # GET /baptism_books/1/edit
  def edit
    @baptism_book = BaptismBook.find(params[:id])
  end

  # POST /baptism_books
  # POST /baptism_books.json
  def create
    @baptism_book = BaptismBook.new(params[:baptism_book])

    respond_to do |format|
      if @baptism_book.save
        format.html { redirect_to @baptism_book, notice: 'Baptism book was successfully created.' }
        format.json { render json: @baptism_book, status: :created, location: @baptism_book }
      else
        format.html { render action: "new" }
        format.json { render json: @baptism_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /baptism_books/1
  # PUT /baptism_books/1.json
  def update
    @baptism_book = BaptismBook.find(params[:id])

    respond_to do |format|
      if @baptism_book.update_attributes(params[:baptism_book])
        format.html { redirect_to @baptism_book, notice: 'Baptism book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @baptism_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baptism_books/1
  # DELETE /baptism_books/1.json
  def destroy
    @baptism_book = BaptismBook.find(params[:id])
    @baptism_book.destroy

    respond_to do |format|
      format.html { redirect_to baptism_books_url }
      format.json { head :no_content }
    end
  end
end
