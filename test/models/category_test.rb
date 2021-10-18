require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    users(:alice).password = "password"
    @alice = users(:alice)
  end

  test "should not save category without title" do
    category = @alice.categories.build
    assert_not category.save
  end

end
