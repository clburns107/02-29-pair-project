MyApp.get "/" do
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