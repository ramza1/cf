require 'test_helper'

class RightAdsControllerTest < ActionController::TestCase
  setup do
    @right_ad = right_ads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:right_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create right_ad" do
    assert_difference('RightAd.count') do
      post :create, right_ad: { name: @right_ad.name, position: @right_ad.position, url: @right_ad.url }
    end

    assert_redirected_to right_ad_path(assigns(:right_ad))
  end

  test "should show right_ad" do
    get :show, id: @right_ad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @right_ad
    assert_response :success
  end

  test "should update right_ad" do
    put :update, id: @right_ad, right_ad: { name: @right_ad.name, position: @right_ad.position, url: @right_ad.url }
    assert_redirected_to right_ad_path(assigns(:right_ad))
  end

  test "should destroy right_ad" do
    assert_difference('RightAd.count', -1) do
      delete :destroy, id: @right_ad
    end

    assert_redirected_to right_ads_path
  end
end
