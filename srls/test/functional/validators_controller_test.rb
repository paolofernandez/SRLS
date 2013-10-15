require 'test_helper'

class ValidatorsControllerTest < ActionController::TestCase
  setup do
    @validator = validators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:validators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create validator" do
    assert_difference('Validator.count') do
      post :create, validator: { comentario: @validator.comentario, id_dato: @validator.id_dato, tabla: @validator.tabla, valido: @validator.valido }
    end

    assert_redirected_to validator_path(assigns(:validator))
  end

  test "should show validator" do
    get :show, id: @validator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @validator
    assert_response :success
  end

  test "should update validator" do
    put :update, id: @validator, validator: { comentario: @validator.comentario, id_dato: @validator.id_dato, tabla: @validator.tabla, valido: @validator.valido }
    assert_redirected_to validator_path(assigns(:validator))
  end

  test "should destroy validator" do
    assert_difference('Validator.count', -1) do
      delete :destroy, id: @validator
    end

    assert_redirected_to validators_path
  end
end
