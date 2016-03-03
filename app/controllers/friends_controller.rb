# CREATES 

MyApp.post "/add_friend/:id" do
  @new_friend = Friend.new
  @new_friend.friend_id = params[:id]
  @new_friend.user_id = session["user_id"]
  @new_friend.save
  redirect "/my_friends"
end

# View a list of all the users the current_user is friends with.
MyApp.get "/my_friends" do
  @all_my_friends = Friend.where(user_id: session["user_id"])
  erb :"friends/users_friends"
end

# View
MyApp.get "/friends_dashboard/:friend_id" do
  # @friend_id = Friend.find_by_id(params[:friend_id])
  @friend = User.find_by_id(params[:friend_id])
  @ratings = Rating.where(user_id: params[:friend_id])
  erb :"friends/friends_dashboard"
end

# Deletes a friendship object from 'friends' table.
MyApp.post "/delete_friend/:friend_id" do
  @friends = Friend.where({user_id: session["user_id"], friend_id: params[:friend_id]})
  @friends.delete_all
  erb :"users/dashboard"
end
