require 'test_helper'

class UserTest < Minitest::Test
  def setup
    super
    @potato = "delish"
    
    # Your setup goes here.
  end

  def test_potato
    assert_equal("delish", @potato)
  end

  # Your tests are defined here.
end