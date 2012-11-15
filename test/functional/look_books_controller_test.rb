require 'test_helper'

class LookBooksControllerTest < ActionController::TestCase
  setup do
    @look_book = look_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:look_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create look_book" do
    assert_difference('LookBook.count') do
      post :create, look_book: { description: @look_book.description, name: @look_book.name }
    end

    assert_redirected_to look_book_path(assigns(:look_book))
  end

  test "should show look_book" do
    get :show, id: @look_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @look_book
    assert_response :success
  end

  test "should update look_book" do
    put :update, id: @look_book, look_book: { description: @look_book.description, name: @look_book.name }
    assert_redirected_to look_book_path(assigns(:look_book))
  end

  test "should destroy look_book" do
    assert_difference('LookBook.count', -1) do
      delete :destroy, id: @look_book
    end

    assert_redirected_to look_books_path
  end
end
