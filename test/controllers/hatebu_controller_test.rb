require 'test_helper'

class HatebuControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch" do
    get hatebu_fetch_url
    assert_response :success
  end

end
