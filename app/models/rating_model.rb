# Columns: user_id, movie_id, stars
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

  # Class Method that creates an array of ratings stars
  # 
  # Takes an argument of ratings objects for 1 movie
  #
  # Returns array of integers
  def self.average_ratings(ratings_objects)
    @ratings_array = []
    ratings_objects.each do |rating|
      @ratings_array << rating.stars
    end
    self.sum_array
    self.avg_sum
  end

  # Class Method that sums all of the numbers inside of an array
  #
  # Takes an argument of an array
  #
  # Returns an integer
  def self.sum_array
    @sum = 0
    @ratings_array.each do |star|
      @sum += star
    end
  end

  # Class Method that creates an average rating
  #
  # Takes an argument of a sum and an array
  #
  # Returns a float
  def self.avg_sum
    @avg_stars = @sum.to_f/@ratings_array.count 
    return @avg_stars.round(1)
  end
end