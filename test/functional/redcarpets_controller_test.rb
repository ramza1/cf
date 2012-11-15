require 'test_helper'

class RedcarpetsControllerTest < ActionController::TestCase
  setup do
    @redcarpet = redcarpets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:redcarpets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create redcarpet" do
    assert_difference('Redcarpet.count') do
      post :create, redcarpet: { title: @redcarpet.title }
    end

    assert_redirected_to redcarpet_path(assigns(:redcarpet))
  end

  test "should show redcarpet" do
    get :show, id: @redcarpet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @redcarpet
    assert_response :success
  end

  test "should update redcarpet" do
    put :update, id: @redcarpet, redcarpet: { title: @redcarpet.title }
    assert_redirected_to redcarpet_path(assigns(:redcarpet))
  end

  test "should destroy redcarpet" do
    assert_difference('Redcarpet.count', -1) do
      delete :destroy, id: @redcarpet
    end

    assert_redirected_to redcarpets_path
  end
end
