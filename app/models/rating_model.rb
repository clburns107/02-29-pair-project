# Columns: user_id, movie_id, rating
#
# Relationship to users: id on users table
# Relationship to movies: id on movies table

class Rating < ActiveRecord::Base

  def title
    @movie = Movie.find_by_id(self.movie_id)
    return @movie.title
  end

  def name
    user = User.find_by_id(self.user_id)
    return user
  end

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