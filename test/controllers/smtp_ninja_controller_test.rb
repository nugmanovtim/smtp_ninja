require 'test_helper'

class SmtpNinjaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get smtp_ninja_index_url
    assert_response :success
  end

  test "should get go" do
    get smtp_ninja_go_url
    assert_response :success
  end

end
