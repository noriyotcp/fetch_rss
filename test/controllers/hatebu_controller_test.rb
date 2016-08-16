require 'test_helper'

class HatebuControllerTest < ActionDispatch::IntegrationTest
  test 'should get hatebu#fetch' do
    get hatebu_url
    assert_response :success
  end
end
