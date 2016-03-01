MyApp.get "/add_friend/:id" do
  @new_friend = Friend.new
  @new_friend.friend_id = params[:id]
  @new_friend.user_id = session["user_id"]
  @new_friend.save
  erb :"friends/users_friends"
end