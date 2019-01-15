require 'test_helper'

class UserRoleTest < ActiveSupport::TestCase

  test "should not save User_Role" do
    a=UserRole.new(role_id:"", user_id:"" )
    assert_not a.save, "Can Save"
  end
  
  test "should not save User_Role blank" do
    a=UserRole.new
    assert_not a.save, "Can Save"
  end

  test "should not save User_Role with letters" do
    a=UserRole.new(role_id:"a", user_id:"b")
    assert_not a.save, "Can Save"
  end

  test "should save User_Role all columns" do
    a=UserRole.new(role_id:roles(:one).id , user_id: users(:two).id )
    assert a.save, "Can't be saved"
  end

end
