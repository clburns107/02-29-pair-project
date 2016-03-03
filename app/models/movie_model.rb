# Columns: title, image_name
class Movie < ActiveRecord::Base

  # given a movie_id and a collection of friend_id's
  # class method that will return a collection of ratings for one movie by multiple friends.
  def self.movies_ratings(friends, params)
    friendses_ids = []
    friends.each do |friend|
      friendses_ids << friend.friend_id
    end
    Rating.where({movie_id: params })
  end

end

MyApp.get "/movie_status_page/:movie_id" do
  @current_user = User.find_by_id(session["user_id"])
  if !@current_user.nil?
    @movie = Movie.find_by_id(params[:movie_id])
    @friends = Friend.where(user_id: session["user_id"])
    @ratings = Rating.where({movie_id: params["movie_id"], user_id: "@friends.friend_id"})
    binding.pry
    erb :"movies/movie_status"
  else
  end
end