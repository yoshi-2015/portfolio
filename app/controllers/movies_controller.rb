class MoviesController < ApplicationController
  def index
    @search_term = params[:looking_for]
    @movie_results = Movie.search(@search_term)["results"]
    @new_movie_info = Movie.newdetails(params[:id])["results"]
    # binding.pry
  end

  def show
    @movie_info = Movie.details(params[:id])
    @cast_info = Movie.castdetails(params[:id])["cast"]
    # binding.pry
    @movie_comment = MovieComment.new
    apimovie_id = @movie_info["id"]
    @movie_comments = MovieComment.where(movie_id: apimovie_id)
  end
end
