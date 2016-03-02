Myapp.get "/add_review" do
  erb :"movies/add_review_form"
end

Myapp.get "/add_movie" do
  erb :"movies/add_movie"
end

Myapp.get "/review_movie" do
  erb :"movies/review_movie"
end