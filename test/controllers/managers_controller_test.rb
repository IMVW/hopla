require 'test_helper'

class ManagersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get managers_index_url
    assert_response :success
  end

  test "should get show" do
    get managers_show_url
    assert_response :success
  end

  test "should get new" do
    get managers_new_url
    assert_response :success
  end

  test "should get create" do
    get managers_create_url
    assert_response :success
  end

  test "should get edit" do
    get managers_edit_url
    assert_response :success
  end

  test "should get update" do
    get managers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get managers_destroy_url
    assert_response :success
  end

end
