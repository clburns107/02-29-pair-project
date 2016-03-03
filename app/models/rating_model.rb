# Columns: user_id, movie_id, rating
#
# Relationship to users: id on users table
# Relationship to movies: id on movies table

class Rating < ActiveRecord::Base

  def title
    @movie = Movie.find_by_id(self.movie_id)
    return @movie.title
  end


end