require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @site = "MicroBlog"
  end
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title","Home | #{@site}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title","Help | #{@site}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title","About | #{@site}"
  end
end
