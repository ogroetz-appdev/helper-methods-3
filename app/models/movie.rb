class Movie < ApplicationRecord
  validates :title, presence: true

  # used with _movie_card partial: 
  # def to_partial_path
  #   "movies/movie_card"
  # end

end
