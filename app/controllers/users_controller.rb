class UsersController < ApplicationController
  # ユーザーを探す定義をonlyで制限
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :follows, :followers]
  def index
    @users = User.all
  end

  def show
    # chek list
    user_checks = Check.where(user_id: @user.id)
    @user_checks = user_checks.all.order(created_at: :desc)
    check_ary = [@check_movie_info]
    @check_movies_info = check_ary.compact

    @user_checks.each do |check|
      @check_movie_id = check.movie_id
      @check_movie_info = Movie.posterdetails(@check_movie_id)
      @check_movies_info << @check_movie_info
    end

    # mark list
    user_marks = Mark.where(user_id: @user.id)
    @user_marks = user_marks.all.order(created_at: :desc)
    mark_ary = [@mark_movie_info]
    @mark_movies_info = mark_ary.compact

    @user_marks.each do |mark|
      @mark_movie_id = mark.movie_id
      @mark_movie_info = Movie.posterdetails(@mark_movie_id)
      @mark_movies_info << @mark_movie_info
    end

    # like list
    user_likes = Like.where(user_id: @user.id)
    @user_likes = user_likes.all.order(created_at: :asc)
    like_ary = [@like_movie_info]
    @like_movies_info = like_ary.compact

    @user_likes.each do |like|
      @like_movie_id = like.movie_id
      @like_movie_info = Movie.posterdetails(@like_movie_id)
      @like_movies_info << @like_movie_info
    end

    # comment list
    user_comments = MovieComment.where(user_id: @user.id)
    @user_comments = user_comments.all.order(rate: :desc)
    comment_ary = [@comment_movie_info]
    @comment_movies_info = comment_ary.compact

    @user_comments.each do |comment|
      @comment_movie_id = comment.movie_id
      @comment_movie_info = Movie.posterdetails(@comment_movie_id)
      @comment_movies_info << @comment_movie_info
    end

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
