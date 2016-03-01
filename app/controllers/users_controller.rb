# Gets a list of all users.
MyApp.get "/list_of_users" do
  @users = User.all
  erb :"users/list_of_users"
end

MyApp.get "/dashboard" do
  erb :"users/dashboard"
end

MyApp.get "/users/new" do
  erb :"users/new"
end

MyApp.get "/users/edit" do
  erb :"users/edit"
end

MyApp.post "/submit/new_user" do
  @new_user = User.new
  @new_user.first_name = params[:first_name]
  @new_user.last_name = params[:last_name]
  @new_user.email = params[:email]
  @new_user.password = params[:password]
  @new_user.save

  if @new_user.password = params[:password]
    # session["user_id"] = @new_user.id
    # @user_reviews = Review.where(user_id: session["user_id"])
    erb :"users/dashboard"
  else
    erb :"login_error"
  end
end