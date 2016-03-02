# Columns: id, email, password, first_name, last_name
#
# Relationship to friends: user_id on friends table
# Relationship to ratings: user_id on ratings table

class User < ActiveRecord::Base
  #
  # Determines if value is an empty String.
  # Sets @erros Array to an Array of errors.
  # def set_errors
  #   @errors = []
  #   if self.email == ""
  #     @errors << "Email cannot be blank!"
  #   end

  #   if self.password == ""
  #     @errors << "Password cannot be blank!"
  #   end
  #   if self.first_name == ""
  #     @errors << "First name cannot be blank!"
  #   end
  #   if self.last_name == ""
  #     @errors << "Last name cannot be blank!"
  #   end
  #   return @errors
  # end

  # def is_valid
  #   self.set_errors
  #   if @errors.length > 0
  #     return false
  #   else
  #     return true
  #   end
  # end

  # Determines if variable holds data that is already in the database.
  # Returns a Boolean
  def duplicate?
    @duplicate = false
    @all_users = User.all

    @all_users.each do |user|
      if self.email == user.email
        @duplicate = true
      end
    end
    return @duplicate
  end
end