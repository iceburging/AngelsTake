require 'test_helper'

class ExpressionTest < ActiveSupport::TestCase
  should_belong_to :distillery
  should_validate_presence_of :name

  context "an expression instance" do
    setup do
      @expression = Factory.build(:expression)
    end
    subject{@expression}
    should "return a name" do
      assert_instance_of String, @expression.name
    end
    should "return a distillery" do
      assert_instance_of Distillery, @expression.distillery
    end
  end
end

