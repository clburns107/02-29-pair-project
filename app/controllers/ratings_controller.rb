MyApp.post "/submit_movie_review/:user_id/:stars/:movie_id" do
  @new_rating = Rating.new
  @new_rating.movie_id = params[:movie_id]
  @new_rating.user_id = params[:user_id]
  @new_rating.stars = params[:stars]
  @new_rating.save
  redirect "/add_review"
end
