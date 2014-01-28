class DeathRecordBooksController < ApplicationController
  load_and_authorize_resource
  # GET /death_record_books
  # GET /death_record_books.json
  def index
    @death_record_books = DeathRecordBook.all
    @death_record_books = DeathRecordBook.order(params[:sort])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @death_record_books }
    end
  end
  
  # GET /death_record_books/search
  # GET /death_record_books/search.json
  def search
    @death_record_books=buscar(params[:codigo], params[:parroquia])
    render 'index'
  end
  
  def buscar(codigo, parroquia)
    books=Array.new 
    aux = DeathRecordBook.all
    if codigo != "" && codigo != nil
      if parroquia  != "" && parroquia != nil
        aux.each do |book|
          if (book.correspondeACodigo(codigo) && book.correspondeAParroquia(parroquia))
            books.push(book)
          end
        end
      else
        aux.each do |book|
          if (book.correspondeACodigo(codigo))
            books.push(book)
          end
        end
      end
    else
      if parroquia  != "" && parroquia != nil
        aux.each do |book|
          if (book.correspondeAParroquia(parroquia))
            books.push(book)
          end
        end
      else
        books = aux
      end
    end
    return books
  end
  
  # GET /death_record_books/searchName
  # GET /death_record_books/searchName.json
  def searchName
    @nombre=params[:nombre]
    @death_record_items=buscarNombre(@nombre)
  end
  
  def buscarNombre(nombre)
    items=Array.new
    aux = DeathRecordItem.all
    if nombre != "" && nombre != nil
      aux.each do |item|
        if (item.correspondeAnombre(nombre))
          items.push(item)
        end
      end
    else
      items = aux
    end
    return items
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
    if @death_record_book.validado
        format.html { redirect_to @death_record_book, notice: 'Validacion ya fue hecha no se puede modificar' }
    end
  end

  # POST /death_record_books
  # POST /death_record_books.json
  def create
    @death_record_book = DeathRecordBook.new(params[:death_record_book])
    @death_record_book.user = current_user
    @death_record_book.validado = false
    respond_to do |format|
      if @death_record_book.save
        format.html { redirect_to @death_record_book, notice: 'Libro de Defunciones creado exitosamente.' }
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
    @death_record_book.user = current_user
    respond_to do |format|
      if @death_record_book.update_attributes(params[:death_record_book])
        format.html { redirect_to @death_record_book, notice: 'Libro de Defunciones actualizado exitosamente.' }
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
