require 'test_helper'

class UserManagersControllerTest < ActionController::TestCase
  setup do
    @user_manager = user_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_manager" do
    assert_difference('UserManager.count') do
      post :create, user_manager: {  }
    end

    assert_redirected_to user_manager_path(assigns(:user_manager))
  end

  test "should show user_manager" do
    get :show, id: @user_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_manager
    assert_response :success
  end

  test "should update user_manager" do
    put :update, id: @user_manager, user_manager: {  }
    assert_redirected_to user_manager_path(assigns(:user_manager))
  end

  test "should destroy user_manager" do
    assert_difference('UserManager.count', -1) do
      delete :destroy, id: @user_manager
    end

    assert_redirected_to user_managers_path
  end
end
