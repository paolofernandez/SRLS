require 'test_helper'

class BaptismBooksControllerTest < ActionController::TestCase
  setup do
    @baptism_book = baptism_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baptism_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baptism_book" do
    assert_difference('BaptismBook.count') do
      post :create, baptism_book: { codigo: @baptism_book.codigo, numero: @baptism_book.numero, paginas: @baptism_book.paginas, partidas_pagina: @baptism_book.partidas_pagina, validado: @baptism_book.validado }
    end

    assert_redirected_to baptism_book_path(assigns(:baptism_book))
  end

  test "should show baptism_book" do
    get :show, id: @baptism_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baptism_book
    assert_response :success
  end

  test "should update baptism_book" do
    put :update, id: @baptism_book, baptism_book: { codigo: @baptism_book.codigo, numero: @baptism_book.numero, paginas: @baptism_book.paginas, partidas_pagina: @baptism_book.partidas_pagina, validado: @baptism_book.validado }
    assert_redirected_to baptism_book_path(assigns(:baptism_book))
  end

  test "should destroy baptism_book" do
    assert_difference('BaptismBook.count', -1) do
      delete :destroy, id: @baptism_book
    end

    assert_redirected_to baptism_books_path
  end
end
