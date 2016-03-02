# Columns: user_id, friend_id
#
# Relationship to users: id on users table

class Friend < ActiveRecord::Base

  #Class Method for collection of an assignee's assignments
  #
  #takes an argument of a collection of assignments
  #
  #Returns all todo items assigned to an assignee
    def self.delete_friend(friends)
  
      friends.each do |friend|
        friend.delete
      end
    end

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

end