require 'test_helper'

class UserTest < Test::Unit::TestCase
  should_have_many :scores
  should_validate_presence_of :name, :email

  context "a user instance" do
    setup do
      @user = Factory.build(:user)
    end
    subject{@user}
    should "return its full name " do
      assert_equal Factory.attributes_for(:user)[:name], @user.name
    end
    should "return an email address" do
      assert !@user.email.nil?
    end
    should "accept new password and store as hashword" do
      @user.password = 'new_password'
      assert_equal Digest::SHA1.hexdigest('new_password' + 'AngelsTake' + @user.salt), @user.hashword
    end
    should_validate_uniqueness_of :email
  end
end

