require 'test_helper'

class DistilleryTest < ActiveSupport::TestCase
  should_have_many :expressions
  should_validate_presence_of :name

  context "a distillery instance" do
    setup do
      @distillery = Factory.build(:distillery)
    end
    subject{@distillery}
    should "return a name" do
      assert_instance_of String, @distillery.name
    end
    should_validate_uniqueness_of :name
    context "with some expressions" do
      setup do
        2.times {@distillery.expressions << Factory.build(:expression, :distillery => nil)}
      end
      should "return some expressions" do
        assert_instance_of Expression, @distillery.expressions[0]
        assert_instance_of Expression, @distillery.expressions[1]
      end
    end
  end
end

