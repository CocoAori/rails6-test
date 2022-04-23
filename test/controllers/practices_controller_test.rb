require 'test_helper'

class PracticesControllerTest < ActionDispatch::IntegrationTest
  test "should get kanji" do
    get practices_kanji_url
    assert_response :success
  end

end
