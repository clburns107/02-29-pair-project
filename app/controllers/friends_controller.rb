MyApp.post "/add_friend/:id" do
  @new_friend = Friend.new
  @new_friend.friend_id = params[:id]
  @new_friend.user_id = session["user_id"]
  @new_friend.save
  erb :"friends/users_friends"
end

MyApp.get "/my_friends" do
  @all_my_friends = Friend.where(user_id: session["user_id"])
  erb :"friends/users_friends"
end