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
    context "that has been created"  do
      setup do
        @user = Factory.create(:user)
      end
      subject{@user}
      context "with some scores" do
        setup do
          4.times {|n| @user.scores << Factory.create(:score,:user => nil,:value => n*9)} #  => 0 9 18 27
        end
        #should "return a high_score" do
        #  assert_equal @user.high_score, 27
        #end
        #should "return a low_score" do
        #  assert_equal @user.low_score, 0
        #end
        #should "return an average_score" do
        #  assert_equal @user.average_score, 13.5
        #end
        should "return ranked_scores" do
          assert_instance_of Array, @user.ranked_scores
          3.times {|n| assert @user.ranked_scores[n].value < @user.ranked_scores[n+1].value, "ranked_score[#{n}] is > ranked_score[#{n+1}]"}
        end
        should "return correctly weighted scores" do
          assert_equal 1.5, @user.ranked_scores[0].weight
          assert_equal 0.5, @user.ranked_scores[1].weight
          assert_equal -0.5, @user.ranked_scores[2].weight
          assert_equal -1.5, @user.ranked_scores[3].weight
        end
      end
    end
  end
end

