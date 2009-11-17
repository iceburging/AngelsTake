require 'test_helper'

class DistilleryTest < ActiveSupport::TestCase
  should "be valid" do
    assert Distillery.new.valid?
  end
end
