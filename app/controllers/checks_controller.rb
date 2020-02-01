class ChecksController < ApplicationController
  def create
    @check = current_user.checks.new
    @check.movie_id = params[:movie_id]
    @check.save
    # 非同期通信
    @apimovie_id = @check.movie_id
    @moviechecks = Check.where(movie_id: @apimovie_id)
    @checkjudgment = @moviechecks.where(user_id: current_user.id)
  end

  def destroy
    @check = Check.find(params[:id])
    @check.destroy
    # 非同期通信
    @apimovie_id = @check.movie_id
    @moviechecks = Check.where(movie_id: @apimovie_id)
    @checkjudgment = @moviechecks.where(user_id: current_user.id)
  end

  private
  def check_params
    params.require(:check).permit(:user_id, :movie_id)
  end
end
