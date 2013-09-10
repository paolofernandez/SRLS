require 'test_helper'

class MarriegeBooksControllerTest < ActionController::TestCase
  setup do
    @marriege_book = marriege_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marriege_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marriege_book" do
    assert_difference('MarriegeBook.count') do
      post :create, marriege_book: { codigo: @marriege_book.codigo, numero: @marriege_book.numero, paginas: @marriege_book.paginas, parroquia: @marriege_book.parroquia, partidas_pagina: @marriege_book.partidas_pagina, validado: @marriege_book.validado }
    end

    assert_redirected_to marriege_book_path(assigns(:marriege_book))
  end

  test "should show marriege_book" do
    get :show, id: @marriege_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marriege_book
    assert_response :success
  end

  test "should update marriege_book" do
    put :update, id: @marriege_book, marriege_book: { codigo: @marriege_book.codigo, numero: @marriege_book.numero, paginas: @marriege_book.paginas, parroquia: @marriege_book.parroquia, partidas_pagina: @marriege_book.partidas_pagina, validado: @marriege_book.validado }
    assert_redirected_to marriege_book_path(assigns(:marriege_book))
  end

  test "should destroy marriege_book" do
    assert_difference('MarriegeBook.count', -1) do
      delete :destroy, id: @marriege_book
    end

    assert_redirected_to marriege_books_path
  end
end
