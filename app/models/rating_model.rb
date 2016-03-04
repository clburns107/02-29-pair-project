# Columns: user_id, movie_id, rating
#
# Relationship to users: id on users table
# Relationship to movies: id on movies table
class Rating < ActiveRecord::Base
  # Returns a movie title for a rating object
  def title
    @movie = Movie.find_by_id(self.movie_id)
    return @movie.title
  end

  # Returns a user object for a rating object
  def name
    user = User.find_by_id(self.user_id)
    return user
  end

  # Class Method for an average star ranking by all of a users
  # friends that have rated it
  #
  # takes an argument of a collection ratings objects for 1 movie
  #
  # returns average rating for of stars for 1 move in movie objects
  def self.avg_stars(ratings_object)
    array = []
    ratings_object.each do |rating|
      array << rating.stars
    end
    sum = 0
    array.each do |star|
      sum += star
    end
    @avg_stars = sum / array.count
    return @avg_stars
  end
end