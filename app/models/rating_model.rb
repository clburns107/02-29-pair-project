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

  # Class Method
  # Defines the average ratings a users's friends have given a movie.
  #
  # Example: 
  ## sum_stars = 18
  ## arr_stars.count = 6
  ## avg_stars = 3
  #
  # Returns an Integer.
  def self.avg_stars
    return sum_stars / arr_stars.count
  end

  # Defines an Array of ratings a users's friends have given movie.
  #
  # Example: arr_stars = [3, 4, 3, 5, 1, 2]
  #
  # Returns an Array of Integers.
  def arr_stars(ratings_object)
    array_of_stars = []
    ratings_object.each do |rating|
      array_of_stars << rating.stars
    end
    return array_of_stars
  end

  # Defines the sum of all ratings a user's friends have given a movie.
  #
  # Example: [3, 4, 3, 5, 1, 2].each do |star|
  ## 0+=3, 3+=4, 7+=3, 10+=5, 15+=1, 16+=2
  ## sum_stars = 18
  # 
  # Returns and Integer for sum.
  def sum_stars
    sum = 0
    arr_stars.each do |star|
      sum += star
    end
    return sum
  end

#   # Defines the average ratings a users's friends have given a movie.
#   #
#   # Example: 18 / 6
#   ## avg_stars = 3
#   #
#   # Returns an Integer.
#   def avg_stars
#     return sum_stars / arr_stars.count
#   end
end