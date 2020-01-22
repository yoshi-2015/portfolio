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
  end
end
