# Columns: title, image_name
class Movie < ActiveRecord::Base

  def set_errors
    @errors = []
    return @errors
  end

  def movie_valid
    if self.title == ""
      @errors << "Title cannot be blank!"
    end
  end

end