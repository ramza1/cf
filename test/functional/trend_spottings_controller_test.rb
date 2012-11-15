require 'test_helper'

class TrendSpottingsControllerTest < ActionController::TestCase
  setup do
    @trend_spotting = trend_spottings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trend_spottings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trend_spotting" do
    assert_difference('TrendSpotting.count') do
      post :create, trend_spotting: { description: @trend_spotting.description, title: @trend_spotting.title }
    end

    assert_redirected_to trend_spotting_path(assigns(:trend_spotting))
  end

  test "should show trend_spotting" do
    get :show, id: @trend_spotting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trend_spotting
    assert_response :success
  end

  test "should update trend_spotting" do
    put :update, id: @trend_spotting, trend_spotting: { description: @trend_spotting.description, title: @trend_spotting.title }
    assert_redirected_to trend_spotting_path(assigns(:trend_spotting))
  end

  test "should destroy trend_spotting" do
    assert_difference('TrendSpotting.count', -1) do
      delete :destroy, id: @trend_spotting
    end

    assert_redirected_to trend_spottings_path
  end
end
