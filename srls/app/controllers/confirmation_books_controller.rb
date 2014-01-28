class ConfirmationBooksController < ApplicationController
  load_and_authorize_resource
  # GET /confirmation_books
  # GET /confirmation_books.json
  def index
    @confirmation_books = ConfirmationBook.all
    @confirmation_books = ConfirmationBook.order(params[:sort])
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @confirmation_books }
    end
  end
  
  # GET /confirmation_books/search
  # GET /confirmation_books/search.json
  def search
    @confirmation_books=buscar(params[:codigo], params[:parroquia])
    render 'index'
  end
  
  def buscar(codigo, parroquia)
    books=Array.new 
    aux = ConfirmationBook.all
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

  # GET /confirmation_books/searchName
  # GET /confirmation_books/searchName.json
  def searchName
    @nombre=params[:nombre]
    @confirmation_items=buscarNombre(@nombre)
  end
  
  def buscarNombre(nombre)
    items=Array.new
    aux = ConfirmationItem.all
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

  # GET /confirmation_books/1
  # GET /confirmation_books/1.json
  def show
    @confirmation_book = ConfirmationBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @confirmation_book }
    end
  end

  # GET /confirmation_books/new
  # GET /confirmation_books/new.json
  def new
    @confirmation_book = ConfirmationBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @confirmation_book }
    end
  end

  # GET /confirmation_books/1/edit
  def edit
    @confirmation_book = ConfirmationBook.find(params[:id])
    if @confirmation_book.validado
        format.html { redirect_to @confirmation_book, notice: 'Validacion ya fue hecha no se puede modificar' }
    end
  end

  # POST /confirmation_books
  # POST /confirmation_books.json
  def create
    @confirmation_book = ConfirmationBook.new(params[:confirmation_book])
    @confirmation_book.user = current_user
    @confirmation_book.validado = false
    respond_to do |format|
      if @confirmation_book.save
        format.html { redirect_to @confirmation_book, notice: 'Libro de Confirmacion creado exitosamente.' }
        format.json { render json: @confirmation_book, status: :created, location: @confirmation_book }
      else
        format.html { render action: "new" }
        format.json { render json: @confirmation_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /confirmation_books/1
  # PUT /confirmation_books/1.json
  def update
    @confirmation_book = ConfirmationBook.find(params[:id])
    @confirmation_book.user = current_user
    respond_to do |format|
      if @confirmation_book.update_attributes(params[:confirmation_book])
        format.html { redirect_to @confirmation_book, notice: 'Libro de Confirmacion actualizad exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @confirmation_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmation_books/1
  # DELETE /confirmation_books/1.json
  def destroy
    @confirmation_book = ConfirmationBook.find(params[:id])
    @confirmation_book.destroy

    respond_to do |format|
      format.html { redirect_to confirmation_books_url }
      format.json { head :no_content }
    end
  end
end
