class MoviesController < ApplicationController
  def index
    @search_term = params[:looking_for]
    @movie_results = Movie.search(@search_term)["results"]
    @new_movie_info = Movie.newdetails(params[:id])["results"]
  end

  def show
    @movie_info = Movie.details(params[:id])
    @cast_info = Movie.castdetails(params[:id])["cast"]

    @movie_newcomment = MovieComment.new
    apimovie_id = @movie_info["id"]
    movie_comments = MovieComment.where(movie_id: apimovie_id)
    @mymovie_comment = movie_comments.where(user_id: current_user.id)
    @othermovie_comments = movie_comments.where.not(user_id: current_user.id)
    # 映画平均点の計算
    ratesum = 0
    movie_comments.each do |comment|
      ratesum += comment.rate
    end
    @average = movie_comments.length == 0 ? 0
    : ratesum / movie_comments.length
  end
end
