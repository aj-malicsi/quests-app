require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    test "user should be able to create categories" do
        sign_in users(:alice)     
        get new_category_path 
        assert_response :success

        post categories_path, params: { category: {title: "Test Category", details: "this is a test category"} }

        assert_response :redirect 
        follow_redirect!
        assert_response :success
        assert_select "p", "Test Category"

    end
    test "user should be able to view categories" do
      sign_in users(:alice)     
      get category_path( categories(:testCategory) )
      assert_response :success

      assert_select "p", "Test Category"


  end

  test "user should be able to edit categories" do
    sign_in users(:alice)     
    get category_path( categories(:testCategory) )
    assert_response :success

    get edit_category_path
    patch category_path( categories(:testCategory) ), params: { category: {title: "Test Category updated"} }
    follow_redirect!
    assert_response :success
    assert_select "p", "Test Category", "there was an error"

  end

  test "user should be able to delete categories" do
    sign_in users(:alice)     
    delete category_path( categories(:testCategory) )
    assert_not_equal( "Test Category", categories(:testCategory).title, "error")
    
  end

end