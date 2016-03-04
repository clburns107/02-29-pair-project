# Submits the rating for a movie by the logged in user
# Checks if rating for movie by user exists in database
# If false - save new rating object for movie
# If true - fetch ratings object and save new stars for rating
MyApp.post "/submit_movie_review/:movie_id/:user_id/:stars" do
  @rating = Rating.exists?({user_id: params[:user_id], movie_id: params[:movie_id]})
  if @rating == false
    @new_rating = Rating.new
    @new_rating.movie_id = params[:movie_id]
    @new_rating.user_id = params[:user_id]
    @new_rating.stars = params[:stars]
    @new_rating.save
  else
    @current_rating = Rating.find_by(user_id: params[:user_id], movie_id: params[:movie_id])
    @current_rating.stars = params[:stars]
    @current_rating.save
  end
  redirect "/add_review"
end
