# Search for a movie you would like to review
MyApp.get "/add_review" do
  erb :"movies/add_review_form"
end

# Create a new movie if search returns no results
MyApp.get "/add_movie" do
  erb :"movies/add_movie"
end

# Displays movie info stored in database
# Displays buttons to rate movie
MyApp.get "/review_movie" do
  erb :"movies/review_movie"
end

MyApp.get "/submit_movie_search" do
  @movie_search = Movie.find_by_title(params[:title])
    if !@movie_search.nil?
      erb :"movies/review_movie"
    else
      erb :"movies/add_movie"
    end
end

MyApp.post "/submit_new_movie" do
  @new_movie = Movie.new
  @new_movie.title = params[:title]
  @new_movie.image_name = params[:image_name]
  @new_movie.save
  erb :"movies/review_movie"
end