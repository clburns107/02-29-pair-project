MyApp.get "/dashboard"  do
  
  erb :"users/dashboard"
end

MyApp.get "/users/new"  do
  
  erb :"users/new"
end

MyApp.get "/users/edit"  do
  
  erb :"users/edit"
end