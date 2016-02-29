require_relative "./_configure"

# DB.define_table("users")
# DB.define_column("users", "name", "string")
# DB.define_column("users", "email", "string")
# DB.define_column("users", "password", "string")

DB.define_table("users")
DB.define_column("users", "email", "string")
DB.define_column("users", "password", "string")
DB.define_column("users", "first_name", "string")
DB.define_column("users", "last_name", "string")

DB.define_table("movies")
DB.define_column("movies", "title", "string")
DB.define_column("movies", "image_name", "string")

DB.define_table("friends")
DB.define_column("friends", "user_id", "integer")
DB.define_column("friends", "friend_id", "integer")

DB.define_table("ratings")
DB.define_column("ratings", "stars", "integer")
DB.define_column("ratings", "user_id", "integer")
DB.define_column("ratings", "movie_id", "integer")