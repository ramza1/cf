require 'test_helper'

class Runway::YearsControllerTest < ActionController::TestCase
  setup do
    @runway_year = runway_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runway_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create runway_year" do
    assert_difference('Runway::Year.count') do
      post :create, runway_year: { year: @runway_year.year }
    end

    assert_redirected_to runway_year_path(assigns(:runway_year))
  end

  test "should show runway_year" do
    get :show, id: @runway_year
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @runway_year
    assert_response :success
  end

  test "should update runway_year" do
    put :update, id: @runway_year, runway_year: { year: @runway_year.year }
    assert_redirected_to runway_year_path(assigns(:runway_year))
  end

  test "should destroy runway_year" do
    assert_difference('Runway::Year.count', -1) do
      delete :destroy, id: @runway_year
    end

    assert_redirected_to runway_years_path
  end
end
