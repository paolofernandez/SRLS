require 'test_helper'

class BaptismItemsControllerTest < ActionController::TestCase
  setup do
    @baptism_item = baptism_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baptism_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baptism_item" do
    assert_difference('BaptismItem.count') do
      post :create, baptism_item: { celebrante: @baptism_item.celebrante, encargado: @baptism_item.encargado, fecha_bautizo: @baptism_item.fecha_bautizo, fecha_nacimiento: @baptism_item.fecha_nacimiento, feligreses: @baptism_item.feligreses, lugar_nacimiento: @baptism_item.lugar_nacimiento, madre: @baptism_item.madre, madrina: @baptism_item.madrina, nombre: @baptism_item.nombre, numero: @baptism_item.numero, oficialia: @baptism_item.oficialia, padre: @baptism_item.padre, padrino: @baptism_item.padrino, tipo_hijo: @baptism_item.tipo_hijo, tomo_libro: @baptism_item.tomo_libro, validado: @baptism_item.validado }
    end

    assert_redirected_to baptism_item_path(assigns(:baptism_item))
  end

  test "should show baptism_item" do
    get :show, id: @baptism_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baptism_item
    assert_response :success
  end

  test "should update baptism_item" do
    put :update, id: @baptism_item, baptism_item: { celebrante: @baptism_item.celebrante, encargado: @baptism_item.encargado, fecha_bautizo: @baptism_item.fecha_bautizo, fecha_nacimiento: @baptism_item.fecha_nacimiento, feligreses: @baptism_item.feligreses, lugar_nacimiento: @baptism_item.lugar_nacimiento, madre: @baptism_item.madre, madrina: @baptism_item.madrina, nombre: @baptism_item.nombre, numero: @baptism_item.numero, oficialia: @baptism_item.oficialia, padre: @baptism_item.padre, padrino: @baptism_item.padrino, tipo_hijo: @baptism_item.tipo_hijo, tomo_libro: @baptism_item.tomo_libro, validado: @baptism_item.validado }
    assert_redirected_to baptism_item_path(assigns(:baptism_item))
  end

  test "should destroy baptism_item" do
    assert_difference('BaptismItem.count', -1) do
      delete :destroy, id: @baptism_item
    end

    assert_redirected_to baptism_items_path
  end
end
