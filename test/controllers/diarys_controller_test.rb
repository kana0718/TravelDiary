require "test_helper"

class DiarysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get diarys_new_url
    assert_response :success
  end

  test "should get index" do
    get diarys_index_url
    assert_response :success
  end

  test "should get show" do
    get diarys_show_url
    assert_response :success
  end

  test "should get edit" do
    get diarys_edit_url
    assert_response :success
  end
end
