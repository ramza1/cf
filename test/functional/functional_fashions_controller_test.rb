require 'test_helper'

class FunctionalFashionsControllerTest < ActionController::TestCase
  setup do
    @functional_fashion = functional_fashions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:functional_fashions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create functional_fashion" do
    assert_difference('FunctionalFashion.count') do
      post :create, functional_fashion: { content: @functional_fashion.content, user_id: @functional_fashion.user_id }
    end

    assert_redirected_to functional_fashion_path(assigns(:functional_fashion))
  end

  test "should show functional_fashion" do
    get :show, id: @functional_fashion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @functional_fashion
    assert_response :success
  end

  test "should update functional_fashion" do
    put :update, id: @functional_fashion, functional_fashion: { content: @functional_fashion.content, user_id: @functional_fashion.user_id }
    assert_redirected_to functional_fashion_path(assigns(:functional_fashion))
  end

  test "should destroy functional_fashion" do
    assert_difference('FunctionalFashion.count', -1) do
      delete :destroy, id: @functional_fashion
    end

    assert_redirected_to functional_fashions_path
  end
end
