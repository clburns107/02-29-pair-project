require 'test_helper'

class FriendTest < Minitest::Test
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

    @user1 = Friend.new
    @user1.user_id = @login1.id
    @user1.friend_id = @login2.id
    @user1.save

    @user2 = Friend.new
    @user2.user_id = @login1.id
    @user2.friend_id = @login3.id
    @user2.save
  end

  def test_potato
    assert_equal("delish", @potato)
  end

  def test_friend_first_name
    assert_equal("Michael", @user1.first_name)
  end

  def test_friend_last_name
    assert_equal("McDonald", @user1.last_name)
  end
  # Your tests are defined here.
end