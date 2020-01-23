class MovieCommentsController < ApplicationController
  def create
    movie = Movie.details(params[:id])
    @movie_comment = current_user.movie_comments.new(movie_comment_params)
    if @movie_comment.save
      redirect_to movie_path(movie)
    else
      render template: "memos/show"
    end
  end

  def destroy
  end

  def movie_comment_params
    params.require(:movie_comment).permit(:comment, :user_id, :movie_id, :rate, :spoiler_status)
  end
end