# Columns: user_id, friend_id
#
# Relationship to users: id on users table

class Friend < ActiveRecord::Base

  #Gets a friends first name from users table
  def first_name
    friend = User.find_by_id(self.friend_id)
    return friend.first_name
  end

  #Gets a friends last name from users table
  def last_name
    friend = User.find_by_id(self.friend_id)
    return friend.last_name
  end

  def user_id
    friend = User.find_by_id(self.friend_id)
    return friend.id
  end
  
end