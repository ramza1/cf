require 'test_helper'

class FashionJuriesControllerTest < ActionController::TestCase
  setup do
    @fashion_jury = fashion_juries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fashion_juries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fashion_jury" do
    assert_difference('FashionJury.count') do
      post :create, fashion_jury: { comments_count: @fashion_jury.comments_count, content: @fashion_jury.content, score: @fashion_jury.score }
    end

    assert_redirected_to fashion_jury_path(assigns(:fashion_jury))
  end

  test "should show fashion_jury" do
    get :show, id: @fashion_jury
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fashion_jury
    assert_response :success
  end

  test "should update fashion_jury" do
    put :update, id: @fashion_jury, fashion_jury: { comments_count: @fashion_jury.comments_count, content: @fashion_jury.content, score: @fashion_jury.score }
    assert_redirected_to fashion_jury_path(assigns(:fashion_jury))
  end

  test "should destroy fashion_jury" do
    assert_difference('FashionJury.count', -1) do
      delete :destroy, id: @fashion_jury
    end

    assert_redirected_to fashion_juries_path
  end
end
