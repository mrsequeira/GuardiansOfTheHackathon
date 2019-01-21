require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should not save user without password and email" do
    a=User.new
    assert_not a.save, "Saved without  name and tshirt_size "
  end

  test "should not save user without password and email nil" do
    a=User.new(email:"", password:"")
    assert_not a.save, "Saved without  name and tshirt_size "
  end

  test "should not save user without email correctly" do
    a=User.new(email:"joao", password:"teste123")
    assert_not a.save, "Saved without  name and tshirt_size "
  end

  test "should not save user without password correctly" do
    a=User.new(email:"joao@ipt.pt", password:"1")
    assert_not a.save, "Saved without  name and tshirt_size "
  end

  test "should not save user with small password" do
    a=User.new(email:"joao@ipt.pt", password:"1234")
    assert_not a.save, "Saved without name and tshirt_size "
  end
  
end
