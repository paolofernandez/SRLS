require 'test_helper'

class ConfirmationItemsControllerTest < ActionController::TestCase
  setup do
    @confirmation_item = confirmation_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:confirmation_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create confirmation_item" do
    assert_difference('ConfirmationItem.count') do
      post :create, confirmation_item: { celebrante: @confirmation_item.celebrante, edad: @confirmation_item.edad, fecha_bautizo: @confirmation_item.fecha_bautizo, fecha_confirmacion: @confirmation_item.fecha_confirmacion, madre: @confirmation_item.madre, madrina: @confirmation_item.madrina, nombre: @confirmation_item.nombre, numero: @confirmation_item.numero, padre: @confirmation_item.padre, padrino: @confirmation_item.padrino, parroquia_bautizo: @confirmation_item.parroquia_bautizo, parroquia_confirmacion: @confirmation_item.parroquia_confirmacion, tomo_libro: @confirmation_item.tomo_libro, validado: @confirmation_item.validado }
    end

    assert_redirected_to confirmation_item_path(assigns(:confirmation_item))
  end

  test "should show confirmation_item" do
    get :show, id: @confirmation_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @confirmation_item
    assert_response :success
  end

  test "should update confirmation_item" do
    put :update, id: @confirmation_item, confirmation_item: { celebrante: @confirmation_item.celebrante, edad: @confirmation_item.edad, fecha_bautizo: @confirmation_item.fecha_bautizo, fecha_confirmacion: @confirmation_item.fecha_confirmacion, madre: @confirmation_item.madre, madrina: @confirmation_item.madrina, nombre: @confirmation_item.nombre, numero: @confirmation_item.numero, padre: @confirmation_item.padre, padrino: @confirmation_item.padrino, parroquia_bautizo: @confirmation_item.parroquia_bautizo, parroquia_confirmacion: @confirmation_item.parroquia_confirmacion, tomo_libro: @confirmation_item.tomo_libro, validado: @confirmation_item.validado }
    assert_redirected_to confirmation_item_path(assigns(:confirmation_item))
  end

  test "should destroy confirmation_item" do
    assert_difference('ConfirmationItem.count', -1) do
      delete :destroy, id: @confirmation_item
    end

    assert_redirected_to confirmation_items_path
  end
end
