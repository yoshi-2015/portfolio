class MarksController < ApplicationController
  def create
    # binding.pry
    @mark = current_user.marks.new
    @mark.movie_id = params[:movie_id]
    @mark.save
    # 補導機通信
    @apimovie_id = @mark.movie_id
    @moviemarks = Mark.where(movie_id: @apimovie_id)
    @markjudgment = @moviemarks.where(user_id: current_user.id)
  end

  def destroy
    @mark = Mark.find(params[:id])
    @mark.destroy
    # 非同期通信
    @apimovie_id = @mark.movie_id
    @moviemarks = Mark.where(movie_id: @apimovie_id)
    @markjudgment = @moviemarks.where(user_id: current_user.id)
  end

  private
  def check_params
    params.require(:mark).permit(:user_id, :movie_id)
  end
end