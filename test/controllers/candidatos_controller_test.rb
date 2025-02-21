require "test_helper"

class CandidatosControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get candidatos_dashboard_url
    assert_response :success
  end
end
