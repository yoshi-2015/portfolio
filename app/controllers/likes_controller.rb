class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.movie_id = params[:movie_id]
    @like.save
    # 補導機通信
    @apimovie_id = @like.movie_id
    @movielikes = Like.where(movie_id: @apimovie_id)
    @likejudgment = @movielikes.where(user_id: current_user.id)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    # 非同期通信
    @apimovie_id = @like.movie_id
    @movielikes = Like.where(movie_id: @apimovie_id)
    @likejudgment = @movielikes.where(user_id: current_user.id)
  end

  private
  def check_params
    params.require(:like).permit(:user_id, :movie_id)
  end
end
