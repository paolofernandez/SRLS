class MarriegeBooksController < ApplicationController
  load_and_authorize_resource
  # GET /marriege_books
  # GET /marriege_books.json
  def index
    @marriege_books = MarriegeBook.all
    @marriege_books = MarriegeBook.order(params[:sort])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marriege_books }
    end
  end
  
  # GET /marriege_books/search
  # GET /marriege_books/search.json
  def search
    @marriege_books=buscar(params[:codigo], params[:parroquia])
    render 'index'
  end
  
  def buscar(codigo, parroquia)
    books=Array.new 
    aux = MarriegeBook.all
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

  # GET /marriege_books/searchName
  # GET /marriege_books/searchName.json
  def searchName
    @nombre=params[:nombre]
    @marriege_items=buscarNombre(@nombre)
  end
  
  def buscarNombre(nombre)
    items=Array.new
    aux = MarriegeItem.all
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
    if @marriege_book.validado
        format.html { redirect_to @marriege_book, notice: 'Validacion ya fue hecha no se puede modificar' }
    end
  end

  # POST /marriege_books
  # POST /marriege_books.json
  def create
    @marriege_book = MarriegeBook.new(params[:marriege_book])
    @marriege_book.user = current_user
    @marriege_book.validado = false
    respond_to do |format|
      if @marriege_book.save
        format.html { redirect_to @marriege_book, notice: 'Libro de Matrimonio creado exitosamente.' }
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
    @marriege_book.user = current_user
    respond_to do |format|
      if @marriege_book.update_attributes(params[:marriege_book])
        format.html { redirect_to @marriege_book, notice: 'Libro de Matrimonio actualizado exitosamente. ' }
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
