require 'test_helper'

class ExpressionTest < ActiveSupport::TestCase
  should "be valid" do
    assert Expression.new.valid?
  end
end
