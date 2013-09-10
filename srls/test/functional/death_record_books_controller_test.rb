require 'test_helper'

class DeathRecordBooksControllerTest < ActionController::TestCase
  setup do
    @death_record_book = death_record_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:death_record_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create death_record_book" do
    assert_difference('DeathRecordBook.count') do
      post :create, death_record_book: { codigo: @death_record_book.codigo, numero: @death_record_book.numero, paginas: @death_record_book.paginas, parroquia: @death_record_book.parroquia, partidas_pagina: @death_record_book.partidas_pagina, validado: @death_record_book.validado }
    end

    assert_redirected_to death_record_book_path(assigns(:death_record_book))
  end

  test "should show death_record_book" do
    get :show, id: @death_record_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @death_record_book
    assert_response :success
  end

  test "should update death_record_book" do
    put :update, id: @death_record_book, death_record_book: { codigo: @death_record_book.codigo, numero: @death_record_book.numero, paginas: @death_record_book.paginas, parroquia: @death_record_book.parroquia, partidas_pagina: @death_record_book.partidas_pagina, validado: @death_record_book.validado }
    assert_redirected_to death_record_book_path(assigns(:death_record_book))
  end

  test "should destroy death_record_book" do
    assert_difference('DeathRecordBook.count', -1) do
      delete :destroy, id: @death_record_book
    end

    assert_redirected_to death_record_books_path
  end
end
