require 'test_helper'

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get languages_index_url
    assert_response :success
  end

  test "should get show" do
    get languages_show_url
    assert_response :success
  end

end
