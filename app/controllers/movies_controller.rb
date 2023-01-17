class MoviesController < ApplicationController
  # before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :set_movie, only: %i[show edit update destroy] # quick way to create an array of symbols
  # before_action :force_user_sign_in

  # def force_user_sign_in
  # end

  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @movies }

      format.html
    end
  end

  def show
    # @movie = Movie.find(params.fetch(:id))
  end

  # def movie_params
  #   params.require(:movie).permit(:title, :description, :image_url, :director_id)
  # end

  def create
    # movie_params = params.require(:movie).permit(:title, :description, :image_url, :director_id)
    
    @movie = Movie.new(movie_params)
    # @movie = Movie.new(self.movie_params)

    if @movie.valid?
      @movie.save

      redirect_to movies_url, notice: "Movie created successfully."
    else
      flash[:alert] = "You haz errors!"
      render "new"
    end
  end

  def edit
    # @movie = Movie.find(params.fetch(:id))
  end

  def update
    # @movie = Movie.find(params.fetch(:id))

    movie_params = params.require(:movie).permit(:title, :description)
    
    # if @movie.update(movie_params)
    # if @movie.update(self.movie_params)
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie updated successfully."
    else
      flash[:alert] = "You haz errors!"
      render "edit"
    end
  end

  def destroy
    # @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end

  private # private methods not for public use

  def set_movie
    @movie = Movie.find(params.fetch(:id))
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :image_url, :director_id, :released_on)
  end

end
