require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

test "should not save category without title" do
  category = category.new
  assert_not category.save
end
