require "test_helper"

class MeshiterroControllerTest < ActionDispatch::IntegrationTest
  test "should get homes" do
    get meshiterro_homes_url
    assert_response :success
  end
end
