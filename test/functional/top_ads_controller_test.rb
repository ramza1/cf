require 'test_helper'

class TopAdsControllerTest < ActionController::TestCase
  setup do
    @top_ad = top_ads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_ad" do
    assert_difference('TopAd.count') do
      post :create, top_ad: { name: @top_ad.name, position: @top_ad.position, url: @top_ad.url }
    end

    assert_redirected_to top_ad_path(assigns(:top_ad))
  end

  test "should show top_ad" do
    get :show, id: @top_ad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @top_ad
    assert_response :success
  end

  test "should update top_ad" do
    put :update, id: @top_ad, top_ad: { name: @top_ad.name, position: @top_ad.position, url: @top_ad.url }
    assert_redirected_to top_ad_path(assigns(:top_ad))
  end

  test "should destroy top_ad" do
    assert_difference('TopAd.count', -1) do
      delete :destroy, id: @top_ad
    end

    assert_redirected_to top_ads_path
  end
end
