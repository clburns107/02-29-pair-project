# Gets a list of all users.
MyApp.get "/list_of_users" do
  @users = User.all
  erb :"users/list_of_users"
end

MyApp.get "/dashboard" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    @ratings = Rating.where(user_id: session["user_id"])
    erb :"users/dashboard"
  else
    erb :"logins/login_error"
  end
end

MyApp.get "/users/new" do
  erb :"users/new"
end

MyApp.post "/submit/new_user" do
  @new_user = User.new
  @new_user.first_name = params[:first_name]
  @new_user.last_name = params[:last_name]
  @new_user.email = params[:email]
  @new_user.password = params[:password]
  @new_user.save

  if @new_user.password = params[:password]
    session["user_id"] = @new_user.id
    @user_reviews = Review.where(user_id: session["user_id"])
    erb :"users/dashboard"
  else
    erb :"logins/login_error"
  end
end

MyApp.get "/users/:id/edit_form" do
  @user = User.find_by_id(params[:id])
  erb :"users/edit"
end

MyApp.post "/submit/update_user" do
  @user = User.find_by_id(session["user_id"])
  if @user != nil
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.save
    redirect "/dashboard"
  else
    erb :"logins/login_error"
  end
end

MyApp.post "/users/delete" do
  @user = User.find_by_id(session["user_id"])
  @user.delete
  redirect "/list_of_users"
end
