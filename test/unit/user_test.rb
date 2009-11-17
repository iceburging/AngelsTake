require 'test_helper'

class UserTest < Test::Unit::TestCase
  context "a user instance" do
    setup do
      @user = Factory.create(:user)
    end
    should "return its full name " do
      assert_equal Factory.attributes_for(:user)[:name], @user.name
    end
    should "accept a password" do
      @user.password = 'password'
    end
  end

end

