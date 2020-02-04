class UsersController < ApplicationController
  # ユーザーを探す定義をonlyで制限
  before_action :set_user, only: [:show, :edit, :update]
  def index
    @users = User.all
  end

  def show
    @userchecks = Check.where(user_id: @user.id)
    ary1 = [@id]
    @ids = ary1.compact
    @userchecks.each do |check|
      @id = check.movie_id
      @ids << @id
    end
    ary2 = [@movies]
    @movies = ary2.compact
    @ids.each do |movie_id|
      @movie = movie_id
      @movie_info = Movie.details(@movie)
      @movies << @movie_info
    end
    # binding.pry
  end

  def edit
    if @user != current_user
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "編集しました！"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  #　フォロー
  def follows
    @user = User.find(params[:id])
    @followings_users = @user.followings
  end

  #　フォワー
  def followers
    @user = User.find(params[:id])
    @followers_users = @user.followers
  end

  private
  # ユーザーを探す定義
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :introduction, :profile_image)
  end
end
