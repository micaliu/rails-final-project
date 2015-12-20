require 'test_helper'

class ThreadContentsControllerTest < ActionController::TestCase
  setup do
    @thread_content = thread_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thread_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thread_content" do
    assert_difference('ThreadContent.count') do
      post :create, thread_content: { content: @thread_content.content, topic_id: @thread_content.topic_id }
    end

    assert_redirected_to thread_content_path(assigns(:thread_content))
  end

  test "should show thread_content" do
    get :show, id: @thread_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thread_content
    assert_response :success
  end

  test "should update thread_content" do
    patch :update, id: @thread_content, thread_content: { content: @thread_content.content, topic_id: @thread_content.topic_id }
    assert_redirected_to thread_content_path(assigns(:thread_content))
  end

  test "should destroy thread_content" do
    assert_difference('ThreadContent.count', -1) do
      delete :destroy, id: @thread_content
    end

    assert_redirected_to thread_contents_path
  end
end
