require 'test_helper'

class FunctionalFashionDesignersControllerTest < ActionController::TestCase
  setup do
    @functional_fashion_designer = functional_fashion_designers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:functional_fashion_designers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create functional_fashion_designer" do
    assert_difference('FunctionalFashionDesigner.count') do
      post :create, functional_fashion_designer: { name: @functional_fashion_designer.name }
    end

    assert_redirected_to functional_fashion_designer_path(assigns(:functional_fashion_designer))
  end

  test "should show functional_fashion_designer" do
    get :show, id: @functional_fashion_designer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @functional_fashion_designer
    assert_response :success
  end

  test "should update functional_fashion_designer" do
    put :update, id: @functional_fashion_designer, functional_fashion_designer: { name: @functional_fashion_designer.name }
    assert_redirected_to functional_fashion_designer_path(assigns(:functional_fashion_designer))
  end

  test "should destroy functional_fashion_designer" do
    assert_difference('FunctionalFashionDesigner.count', -1) do
      delete :destroy, id: @functional_fashion_designer
    end

    assert_redirected_to functional_fashion_designers_path
  end
end
