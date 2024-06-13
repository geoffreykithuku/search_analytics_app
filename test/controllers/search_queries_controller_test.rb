require "test_helper"

class SearchQueriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get search_queries_create_url
    assert_response :success
  end
end
