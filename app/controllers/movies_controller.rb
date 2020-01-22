class MoviesController < ApplicationController
  def search
    @search_term = params[:looking_for]
    @movie_results = Movie.search(@search_term)["results"]
    # binding.pry
  end

  def show
    @movie_info = Movie.details(params[:id])
    @cast_info = Movie.cdetails(params[:id])["cast"]
    # binding.pry
  end
end
