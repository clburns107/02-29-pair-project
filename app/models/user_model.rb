# Columns: id, email, password, first_name, last_name
#
# Relationship to friends: user_id on friends table
# Relationship to ratings: user_id on ratings table

class User < ActiveRecord::Base
  #
  # Determines if value is an empty String.
  # Sets @errors Array to an Array of errors.
  def set_errors
    @errors = []
  end

  # Gets @errors Array.
  def get_errors
    return @errors
  end

  # Defines if a user enters an empty String.
  # Returns a Boolean.
  def email_empty
    self.email = ""
  end

  # Defines if a user enters an "@" symbol.
  # Returns a Boolean.
  def email_tomlinson
    self.email.include?("@")
  end

  # Defines if an user's entered email is valid.
  # Returns an Array for @errors, 
  # @errors will be empty if the user entered a valid email.
  def email_valid
    if email_empty
      @errors << "Email cannot be blank!"
    end
    if email_tomlinson == false
      @errors << "Email must contain an '@' symbol!"
    end
  end

  def password_valid
    if self.password == ""
      @errors << "Password cannot be blank!"
    end
  end

  def name_valid
    if self.first_name == ""
      @errors << "First name cannot be blank!"
    end
    if self.last_name == ""
      @errors << "Last name cannot be blank!"
    end   
  end

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
      else
        @duplicate = false
      end
    end
    return @duplicate
  end
end