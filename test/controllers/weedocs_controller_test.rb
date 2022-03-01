require 'test_helper'

class WeedocsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weedocs_index_url
    assert_response :success
  end

  test "should get add" do
    get weedocs_add_url
    assert_response :success
  end

  test "should get delete" do
    get weedocs_delete_url
    assert_response :success
  end

end
