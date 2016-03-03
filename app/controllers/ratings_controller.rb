MyApp.post "/submit_movie_review/:movie_id/:user_id/:stars" do
  @new_rating = Rating.new
  @new_rating.movie_id = params[:movie_id]
  @new_rating.user_id = params[:user_id]
  @new_rating.stars = params[:stars]
  @new_rating.save
  redirect "/add_review"
end
