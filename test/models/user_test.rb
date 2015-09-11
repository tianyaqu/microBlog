require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(name:'zhangsan',email:'lisi')
  end
  
  test "should be valid" do
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "a"*200
    assert_not @user.valid?
  end
  test "name should not be too long" do
    @user.email = "abcdefg"
    @user.name = "a"*200
    assert_not @user.valid?
  end
  
  test "email regrex validation" do
    @user.name = "zhangsan"
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |email|
        @user.email = email
        assert_not @user.valid?,"#{email.inspect} should be invalid"
    end
  end
end
