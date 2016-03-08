require 'test_helper'

class RatingTest < Minitest::Test
  def setup
    super
    @potato = "delish"

    @user1 = User.new
    @user1.email = "example@example.com"
    @user1.first_name = "Kenny"
    @user1.last_name = "Loggins"
    @user1.password = "dangerzone"
    @user1.save

    @user2 = User.new
    @user2.email = "example@example.com"
    @user2.first_name = "Michael"
    @user2.last_name = "McDonald"
    @user2.password = "sweetfreedom"
    @user2.save

    @movie1 = Movie.new
    @movie1.title = "The Brass Teapot"
    @movie1.image_name = "http://ia.media-imdb.com/images/M/MV5BMTEyNDIxOTE3NDheQTJeQWpwZ15BbWU3MDI0ODE5OTg@._V1_SX300.jpg"
    @movie1.save

    @movie2 = Movie.new
    @movie2.title = "YPF"
    @movie2.image_name = "http://ia.media-imdb.com/images/M/MV5BMTI1MDA2MzY2NV5BMl5BanBnXkFtZTcwODkxMTA3MQ@@._V1_SX300.jpg"
    @movie2.save

    @rating1 = Rating.new
    @rating1.user_id = @user1.id
    @rating1.movie_id = @movie1.id
    @rating1.stars = 5
    @rating1.save

    @rating2 = Rating.new
    @rating2.user_id = @user2.id
    @rating2.movie_id = @movie1.id
    @rating2.stars = 1
    @rating2.save
  end

  def test_potato
    assert_equal("delish", @potato)
  end

  def test_movie_title
    assert_equal("The Brass Teapot", @rating1.title)
  end

  def test_user_name
    assert_equal("Kenny", @rating1.name.first_name)
    assert_equal("Loggins", @rating1.name.last_name)
  end

  def test_average_rating_for_movie
    all_ratings_for_movie = Rating.where(movie_id: @movie1.id)
    assert_equal(3, Rating.average_ratings(all_ratings_for_movie))
  end
  # Your tests are defined here.
end


















