# Columns: user_id, friend_id
#
# Relationship to users: id on users table
class Friend < ActiveRecord::Base
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

  # Class Method for collection of a user's friends' ratings
  #
  # takes an argument of a collection of friends
  #
  # Returns all ratings belonging to all friends inside of an array
  def self.friends_reviews(friends)
    friendses_ids = []
    friends.each do |friend|
      friendses_ids << friend.friend_id
    end
    friendses_rating_objects = Rating.where({user_id: friendses_ids})
    return friendses_rating_objects
  end

  # Class Method for a collection of ratings by friends for one movie
  #
  # takes an argument of a collection of friends and a movie
  #
  # returns all ratings object for any one movie by all of a users friends
  def self.friend_review_for_movies(friends, movie)
    friendses_ids = []
    friends.each do |friend|
      friendses_ids << friend.friend_id
    end
    friendses_rating_objects = Rating.where({movie_id: movie.id, user_id: friendses_ids})
    return friendses_rating_objects
  end
end