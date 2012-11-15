require 'test_helper'

class Runway::SeasonsControllerTest < ActionController::TestCase
  setup do
    @runway_season = runway_seasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runway_seasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create runway_season" do
    assert_difference('Runway::Season.count') do
      post :create, runway_season: { period: @runway_season.period }
    end

    assert_redirected_to runway_season_path(assigns(:runway_season))
  end

  test "should show runway_season" do
    get :show, id: @runway_season
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @runway_season
    assert_response :success
  end

  test "should update runway_season" do
    put :update, id: @runway_season, runway_season: { period: @runway_season.period }
    assert_redirected_to runway_season_path(assigns(:runway_season))
  end

  test "should destroy runway_season" do
    assert_difference('Runway::Season.count', -1) do
      delete :destroy, id: @runway_season
    end

    assert_redirected_to runway_seasons_path
  end
end
