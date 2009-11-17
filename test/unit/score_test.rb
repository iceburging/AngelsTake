require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  should "be valid" do
    assert Score.new.valid?
  end
end
