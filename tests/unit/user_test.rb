require 'test_helper'

class UserTest < Minitest::Test
  def setup
    super
    @potato = "delish"

    @login1 = User.new
    @login1.email = "example@example.com"
    @login1.first_name = "Kenny"
    @login1.last_name = "Loggins"
    @login1.password = "dangerzone"
    @login1.save

    @login2 = User.new
    @login2.email = "example@example.com"
    @login2.first_name = "Michael"
    @login2.last_name = "McDonald"
    @login2.password = "sweetfreedom"
    @login2.save

    @login3 = User.new
    @login3.email = "test@example.com"
    @login3.first_name = "Skunk"
    @login3.last_name = "Baxter"
    @login3.password = "doobiebrothers"
    @login3.save

  end

  def test_potato
    assert_equal("delish", @potato)
  end

  # Test to see if duplicate method returns true if two users create the same email address.
  # Returns 'true'
  def test_if_duplicate_true
    @login4 = User.new
    @login4.email = "test@example.com"
    @login4.first_name = "Cher"
    @login4.last_name = "Bone"
    @login4.password = "sonnyandcher"
    @login4.save    
    assert_equal(true, @login4.duplicate?)
  end

  # Test to see if a duplicate method returns false if two users create different email addresses.
  # Returns 'false'
  def test_if_duplicate_false
    @login5 = User.new
    @login5.email = "different@example.com"
    @login5.first_name = "Bryan"
    @login5.last_name = "Adams"
    @login5.password = "summerof69"
    @login5.save    
    assert_equal(false, @login5.duplicate?)
  end





  # Your tests are defined here.
end