class DeathRecordBooksController < ApplicationController
  # GET /death_record_books
  # GET /death_record_books.json
  def index
    @death_record_books = DeathRecordBook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @death_record_books }
    end
  end

  # GET /death_record_books/1
  # GET /death_record_books/1.json
  def show
    @death_record_book = DeathRecordBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @death_record_book }
    end
  end

  # GET /death_record_books/new
  # GET /death_record_books/new.json
  def new
    @death_record_book = DeathRecordBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @death_record_book }
    end
  end

  # GET /death_record_books/1/edit
  def edit
    @death_record_book = DeathRecordBook.find(params[:id])
  end

  # POST /death_record_books
  # POST /death_record_books.json
  def create
    @death_record_book = DeathRecordBook.new(params[:death_record_book])

    respond_to do |format|
      if @death_record_book.save
        format.html { redirect_to @death_record_book, notice: 'Death record book was successfully created.' }
        format.json { render json: @death_record_book, status: :created, location: @death_record_book }
      else
        format.html { render action: "new" }
        format.json { render json: @death_record_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /death_record_books/1
  # PUT /death_record_books/1.json
  def update
    @death_record_book = DeathRecordBook.find(params[:id])

    respond_to do |format|
      if @death_record_book.update_attributes(params[:death_record_book])
        format.html { redirect_to @death_record_book, notice: 'Death record book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @death_record_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /death_record_books/1
  # DELETE /death_record_books/1.json
  def destroy
    @death_record_book = DeathRecordBook.find(params[:id])
    @death_record_book.destroy

    respond_to do |format|
      format.html { redirect_to death_record_books_url }
      format.json { head :no_content }
    end
  end
end