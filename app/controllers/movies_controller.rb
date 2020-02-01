class MoviesController < ApplicationController
  def index
    @search_term = params[:looking_for]
    @movie_results = Movie.search(@search_term)["results"]
    @new_movie_info = Movie.newdetails(params[:id])["results"]
  end

  def show
    @movie_info = Movie.details(params[:id])
    @poster_info = Movie.posterdetails(params[:id])
    @cast_info = Movie.castdetails(params[:id])["cast"]
    @apimovie_id = @movie_info["id"]

    @movie_newcomment = MovieComment.new
    movie_comments = MovieComment.where(movie_id: @apimovie_id)
    @mymovie_comment = movie_comments.where(user_id: current_user.id)
    @othermovie_comments = movie_comments.where.not(user_id: current_user.id)

    # 映画平均点の計算
    ratesum = 0
    movie_comments.each do |comment|
      ratesum += comment.rate
    end
    @average = movie_comments.length == 0 ? 0
    : ratesum / movie_comments.length

    # check機能１
    @check = Check.new
    @moviechecks = Check.where(movie_id: @apimovie_id)
    @checkjudgment = @moviechecks.where(user_id: current_user.id)
    # mark機能
    @merk = Mark.new
    @moviemarks = Mark.where(movie_id: @apimovie_id)
    @markjudgment = @moviemarks.where(user_id: current_user.id)
  end
end
