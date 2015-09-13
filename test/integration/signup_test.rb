require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
        post users_path,user:{name:"",email:".c@b.com"}
    end
    assert_template 'users/new'
  end
end
