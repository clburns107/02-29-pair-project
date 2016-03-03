# Columns: user_id, friend_id
#
# Relationship to users: id on users table

class Friend < ActiveRecord::Base
  #
  # Gets a friends first name from users table
  def first_name
    friend = User.find_by_id(self.friend_id)
    return friend.first_name
  end

  # Gets a friends last name from users table
  def last_name
    friend = User.find_by_id(self.friend_id)
    return friend.last_name
  end


#Class Method for collection of a user's friends' ratings
#
#takes an argument of a collection of friends
#
#Returns all ratings belonging to all friends inside of an array

  def self.friends_reviews(friends)
    friendses_ids = []
    friendses_rating_objects = []

    friends.each do |f|
      friendses_ids << f.friend_id
    end

    friendses_ids.each do |id|
      friendses_rating_objects << Rating.where(user_id: id)
    end

    return friendses_rating_objects
  end

end