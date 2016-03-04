# Gets a list of all users.
MyApp.get "/list_of_users" do
  @current_user = User.find_by_id(session["user_id"])
  if !@current_user.nil?
    @users = User.all
    erb :"users/list_of_users"
  else
    erb :"logins/login_error"
  end
end

# Displays a user's list of movie reviews.
MyApp.get "/dashboard" do
  @current_user = User.find_by_id(session["user_id"])
  if !@current_user.nil?
    @ratings = Rating.where(user_id: session["user_id"])
    erb :"users/dashboard"
  else
    erb :"logins/login_error"
  end
end

# Displays a form to Create a new user.
MyApp.get "/users/new" do
  erb :"users/new"
end

MyApp.post "/submit/new_user" do
  @new_user = User.new
  @new_user.first_name = params[:first_name]
  @new_user.last_name = params[:last_name]
  @new_user.email = params[:email]
  @new_user.password = params[:password]
  @new_user.set_errors
  @new_user.email_valid
  @new_user.password_valid
  @new_user.name_valid
  @errors = @new_user.get_errors

  if @new_user.set_errors == nil
  @new_user.save
    if @new_user.password = params[:password]
      session["user_id"] = @new_user.id
      @user_reviews = Rating.where(user_id: session["user_id"])
      erb :"users/dashboard"
    else
      erb :"logins/login_error"
    end
  else
    erb :"users/new"
  end 
end

# Displays a form to edit a user's profile information.
MyApp.get "/users/:id/edit_form" do
  @current_user = User.find_by_id(session["user_id"])
  if !@current_user.nil?
    @user = User.find_by_id(params[:id])
    erb :"users/edit"
  else
    erb :"logins/login_error"
  end
end

# Submits a form to edit a user's profile information.
MyApp.post "/submit/update_user" do
  @user = User.find_by_id(session["user_id"])
  if !@user.nil?
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

# Submits a request to delete a user.
MyApp.post "/users/delete" do 
  @user = User.find_by_id(session["user_id"])
  @user.delete
  redirect "/list_of_users"
end
