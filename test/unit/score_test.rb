require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  should_belong_to :user, :expression
  should_validate_presence_of :value

  context "a score instance" do
    setup do
      @score = Factory.build(:score)
    end
    subject{@score}
    should "return a value" do
      assert_instance_of Fixnum, @score.value
    end
    should "return a user" do
      assert_instance_of User, @score.user
    end
    should "return an expression" do
      assert_instance_of Expression, @score.expression
    end
  end
end

