require 'test_helper'

class ConfirmationBooksControllerTest < ActionController::TestCase
  setup do
    @confirmation_book = confirmation_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:confirmation_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create confirmation_book" do
    assert_difference('ConfirmationBook.count') do
      post :create, confirmation_book: { codigo: @confirmation_book.codigo, numero: @confirmation_book.numero, paginas: @confirmation_book.paginas, partidas_pagina: @confirmation_book.partidas_pagina, validado: @confirmation_book.validado }
    end

    assert_redirected_to confirmation_book_path(assigns(:confirmation_book))
  end

  test "should show confirmation_book" do
    get :show, id: @confirmation_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @confirmation_book
    assert_response :success
  end

  test "should update confirmation_book" do
    put :update, id: @confirmation_book, confirmation_book: { codigo: @confirmation_book.codigo, numero: @confirmation_book.numero, paginas: @confirmation_book.paginas, partidas_pagina: @confirmation_book.partidas_pagina, validado: @confirmation_book.validado }
    assert_redirected_to confirmation_book_path(assigns(:confirmation_book))
  end

  test "should destroy confirmation_book" do
    assert_difference('ConfirmationBook.count', -1) do
      delete :destroy, id: @confirmation_book
    end

    assert_redirected_to confirmation_books_path
  end
end
