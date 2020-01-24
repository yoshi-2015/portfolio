class MovieCommentsController < ApplicationController
  def create
    # binding.pry
    @movie_comment = current_user.movie_comments.new(movie_comment_params)
    movie_id = @movie_comment.movie_id
    @movie_comments = MovieComment.where(movie_id: movie_id)
    if @movie_comment.save
    else
      render template: "memos/show"
    end
  end

  def destroy
    # binding.pry
    @movie_comment = MovieComment.find(params[:id])
    @movie_comment.destroy
    movie_id = @movie_comment.movie_id
    @movie_comments = MovieComment.where(movie_id: movie_id)
  end

  def movie_comment_params
    params.require(:movie_comment).permit(:comment, :user_id, :movie_id, :rate, :spoiler_status)
  end
end