MyApp.get "/" do
  @users = User.count
  erb :"logins/logins"
end

MyApp.post "/login_user" do
  @current_user = User.find_by_email(params[:email])
  if @current_user.password == params[:password]
    session["user_id"] = @current_user.id
    redirect "/dashboard"
  else
    erb :"logins/login_error"
  end
end

MyApp.get "/submit_logout" do
  @current_user = User.find_by_id(session["user_id"])
  if !@current_user.nil?
    session["user_id"] = nil
    redirect "/"
  else
    erb :"logins/login_error"
  end
end