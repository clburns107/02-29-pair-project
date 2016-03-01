# Columns: id, email, password, first_name, last_name
#
# Relationship to friends: user_id on friends table
# Relationship to ratings: user_id on ratings table

class User < ActiveRecord::Base
end