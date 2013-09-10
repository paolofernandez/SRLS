require 'test_helper'

class MarriegeItemsControllerTest < ActionController::TestCase
  setup do
    @marriege_item = marriege_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marriege_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marriege_item" do
    assert_difference('MarriegeItem.count') do
      post :create, marriege_item: { bendicion_nupcial_de: @marriege_item.bendicion_nupcial_de, celebrante: @marriege_item.celebrante, edad_esposa: @marriege_item.edad_esposa, edad_esposo: @marriege_item.edad_esposo, en_el: @marriege_item.en_el, en_fecha: @marriege_item.en_fecha, encargado: @marriege_item.encargado, fecha_bautizo_esposa: @marriege_item.fecha_bautizo_esposa, fecha_bautizo_esposo: @marriege_item.fecha_bautizo_esposo, fecha_matrimonio: @marriege_item.fecha_matrimonio, fecha_nacimiento_esposa: @marriege_item.fecha_nacimiento_esposa, fecha_nacimiento_esposo: @marriege_item.fecha_nacimiento_esposo, feligreses: @marriege_item.feligreses, lugar_nacimiento_esposa: @marriege_item.lugar_nacimiento_esposa, lugar_nacimiento_esposo: @marriege_item.lugar_nacimiento_esposo, madre_esposa: @marriege_item.madre_esposa, madre_esposo: @marriege_item.madre_esposo, nombre_esposa: @marriege_item.nombre_esposa, nombre_esposo: @marriege_item.nombre_esposo, num_partida_libreta_familiar: @marriege_item.num_partida_libreta_familiar, numero: @marriege_item.numero, oficialia: @marriege_item.oficialia, padre_esposa: @marriege_item.padre_esposa, padre_esposo: @marriege_item.padre_esposo, parroquia_bautizo_esposa: @marriege_item.parroquia_bautizo_esposa, parroquia_bautizo_esposo: @marriege_item.parroquia_bautizo_esposo, primer_testigo: @marriege_item.primer_testigo, profesion_esposa: @marriege_item.profesion_esposa, profesion_esposo: @marriege_item.profesion_esposo, segundo_testigo: @marriege_item.segundo_testigo, tipo_hijo_esposa: @marriege_item.tipo_hijo_esposa, tipo_hijo_esposo: @marriege_item.tipo_hijo_esposo, tomo_libro: @marriege_item.tomo_libro, validado: @marriege_item.validado }
    end

    assert_redirected_to marriege_item_path(assigns(:marriege_item))
  end

  test "should show marriege_item" do
    get :show, id: @marriege_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marriege_item
    assert_response :success
  end

  test "should update marriege_item" do
    put :update, id: @marriege_item, marriege_item: { bendicion_nupcial_de: @marriege_item.bendicion_nupcial_de, celebrante: @marriege_item.celebrante, edad_esposa: @marriege_item.edad_esposa, edad_esposo: @marriege_item.edad_esposo, en_el: @marriege_item.en_el, en_fecha: @marriege_item.en_fecha, encargado: @marriege_item.encargado, fecha_bautizo_esposa: @marriege_item.fecha_bautizo_esposa, fecha_bautizo_esposo: @marriege_item.fecha_bautizo_esposo, fecha_matrimonio: @marriege_item.fecha_matrimonio, fecha_nacimiento_esposa: @marriege_item.fecha_nacimiento_esposa, fecha_nacimiento_esposo: @marriege_item.fecha_nacimiento_esposo, feligreses: @marriege_item.feligreses, lugar_nacimiento_esposa: @marriege_item.lugar_nacimiento_esposa, lugar_nacimiento_esposo: @marriege_item.lugar_nacimiento_esposo, madre_esposa: @marriege_item.madre_esposa, madre_esposo: @marriege_item.madre_esposo, nombre_esposa: @marriege_item.nombre_esposa, nombre_esposo: @marriege_item.nombre_esposo, num_partida_libreta_familiar: @marriege_item.num_partida_libreta_familiar, numero: @marriege_item.numero, oficialia: @marriege_item.oficialia, padre_esposa: @marriege_item.padre_esposa, padre_esposo: @marriege_item.padre_esposo, parroquia_bautizo_esposa: @marriege_item.parroquia_bautizo_esposa, parroquia_bautizo_esposo: @marriege_item.parroquia_bautizo_esposo, primer_testigo: @marriege_item.primer_testigo, profesion_esposa: @marriege_item.profesion_esposa, profesion_esposo: @marriege_item.profesion_esposo, segundo_testigo: @marriege_item.segundo_testigo, tipo_hijo_esposa: @marriege_item.tipo_hijo_esposa, tipo_hijo_esposo: @marriege_item.tipo_hijo_esposo, tomo_libro: @marriege_item.tomo_libro, validado: @marriege_item.validado }
    assert_redirected_to marriege_item_path(assigns(:marriege_item))
  end

  test "should destroy marriege_item" do
    assert_difference('MarriegeItem.count', -1) do
      delete :destroy, id: @marriege_item
    end

    assert_redirected_to marriege_items_path
  end
end
