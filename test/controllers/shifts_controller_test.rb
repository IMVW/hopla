require 'test_helper'

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shifts_index_url
    assert_response :success
  end

  test "should get show" do
    get shifts_show_url
    assert_response :success
  end

  test "should get new" do
    get shifts_new_url
    assert_response :success
  end

  test "should get create" do
    get shifts_create_url
    assert_response :success
  end

  test "should get edit" do
    get shifts_edit_url
    assert_response :success
  end

  test "should get update" do
    get shifts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shifts_destroy_url
    assert_response :success
  end

end
