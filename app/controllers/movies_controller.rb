# Displays form to search for movie to review
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
  @current_user = User.find_by_id(session["user_id"])
  if !@current_user.nil?
    erb :"movies/review_movie"
  else 
    erb :"login_error.erb"
  end
end

MyApp.get "/submit_movie_search" do
  @current_user = User.find_by_id(session["user_id"])
    if !@current_user.nil?
      @movie_search = Movie.find_by_title(params[:title])
      if !@movie_search.nil?
        binding.pry
        erb :"movies/review_movie"
      else
        erb :"movies/add_movie"
      end
    else
      erb :"logins/login_error"
    end
end

MyApp.post "/submit_new_movie" do
  @api = HTTParty.get("http://www.omdbapi.com/?t=#{params["title"]}&y=&plot=short&r=json")
  @new_movie = Movie.new
  @new_movie.title = params[:title]
  @new_movie.image_name = @api["Poster"]
  @new_movie.save
  erb :"movies/review_movie"
end

MyApp.get "/update_movie/:id" do
  @movie = Movie.find_by_id(params[:id])
  erb :"movies/update_movie"
end

MyApp.post "/submit_movie_update_form/:id" do
  @movie_search = Movie.find_by_id(params[:id])
  @movie_search.image_name = params[:image_name]
  @movie_search.title = params[:title]
  @movie_search.save
  erb :"movies/review_movie"
end








