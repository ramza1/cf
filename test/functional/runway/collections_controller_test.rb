require 'test_helper'

class Runway::CollectionsControllerTest < ActionController::TestCase
  setup do
    @runway_collection = runway_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runway_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create runway_collection" do
    assert_difference('Runway::Collection.count') do
      post :create, runway_collection: { name: @runway_collection.name }
    end

    assert_redirected_to runway_collection_path(assigns(:runway_collection))
  end

  test "should show runway_collection" do
    get :show, id: @runway_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @runway_collection
    assert_response :success
  end

  test "should update runway_collection" do
    put :update, id: @runway_collection, runway_collection: { name: @runway_collection.name }
    assert_redirected_to runway_collection_path(assigns(:runway_collection))
  end

  test "should destroy runway_collection" do
    assert_difference('Runway::Collection.count', -1) do
      delete :destroy, id: @runway_collection
    end

    assert_redirected_to runway_collections_path
  end
end
