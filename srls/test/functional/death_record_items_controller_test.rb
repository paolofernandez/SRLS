require 'test_helper'

class DeathRecordItemsControllerTest < ActionController::TestCase
  setup do
    @death_record_item = death_record_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:death_record_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create death_record_item" do
    assert_difference('DeathRecordItem.count') do
      post :create, death_record_item: { celebrante: @death_record_item.celebrante, edad: @death_record_item.edad, fecha: @death_record_item.fecha, lugar_sepultura: @death_record_item.lugar_sepultura, madre: @death_record_item.madre, motivo_muerte: @death_record_item.motivo_muerte, nombre: @death_record_item.nombre, numero: @death_record_item.numero, padre: @death_record_item.padre, tipo_hijo: @death_record_item.tipo_hijo, tomo_libro: @death_record_item.tomo_libro, validado: @death_record_item.validado }
    end

    assert_redirected_to death_record_item_path(assigns(:death_record_item))
  end

  test "should show death_record_item" do
    get :show, id: @death_record_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @death_record_item
    assert_response :success
  end

  test "should update death_record_item" do
    put :update, id: @death_record_item, death_record_item: { celebrante: @death_record_item.celebrante, edad: @death_record_item.edad, fecha: @death_record_item.fecha, lugar_sepultura: @death_record_item.lugar_sepultura, madre: @death_record_item.madre, motivo_muerte: @death_record_item.motivo_muerte, nombre: @death_record_item.nombre, numero: @death_record_item.numero, padre: @death_record_item.padre, tipo_hijo: @death_record_item.tipo_hijo, tomo_libro: @death_record_item.tomo_libro, validado: @death_record_item.validado }
    assert_redirected_to death_record_item_path(assigns(:death_record_item))
  end

  test "should destroy death_record_item" do
    assert_difference('DeathRecordItem.count', -1) do
      delete :destroy, id: @death_record_item
    end

    assert_redirected_to death_record_items_path
  end
end
