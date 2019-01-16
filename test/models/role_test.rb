require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save role without name" do
    a=Role.new()
    assert_not a.save, "Saved without a name"
  end

  test "should save role with name" do
    a=Role.new(name:"Role")
    assert a.save, "Saved with a name"
  end

end
