require 'test_helper'

class MenFashionsControllerTest < ActionController::TestCase
  setup do
    @men_fashion = men_fashions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:men_fashions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create men_fashion" do
    assert_difference('MenFashion.count') do
      post :create, men_fashion: { content: @men_fashion.content, title: @men_fashion.title }
    end

    assert_redirected_to men_fashion_path(assigns(:men_fashion))
  end

  test "should show men_fashion" do
    get :show, id: @men_fashion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @men_fashion
    assert_response :success
  end

  test "should update men_fashion" do
    put :update, id: @men_fashion, men_fashion: { content: @men_fashion.content, title: @men_fashion.title }
    assert_redirected_to men_fashion_path(assigns(:men_fashion))
  end

  test "should destroy men_fashion" do
    assert_difference('MenFashion.count', -1) do
      delete :destroy, id: @men_fashion
    end

    assert_redirected_to men_fashions_path
  end
end
