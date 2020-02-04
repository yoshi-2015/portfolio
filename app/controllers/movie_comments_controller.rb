class MovieCommentsController < ApplicationController
  def create
    # コメント投稿
    @movie_newcomment = current_user.movie_comments.new(movie_comment_params)
    # 非同期通信
    movie_id = @movie_newcomment.movie_id
    movie_comments = MovieComment.where(movie_id: movie_id)
    @mymovie_comment = movie_comments.where(user_id: current_user.id)
    @othermovie_comments = movie_comments.where.not(user_id: current_user.id)

    # コメントを1人1つまでに制限
    if @movie_newcomment = movie_comments.where(user_id: current_user.id).exists?
    else
      @movie_newcomment = current_user.movie_comments.new(movie_comment_params)
      if @movie_newcomment.save
      end
    end

    # 非同期通信時の映画平均点の計算
    ratesum = 0
    movie_comments.each do |comment|
      ratesum += comment.rate
    end
    @average = movie_comments.length == 0 ? 0
    : ratesum / movie_comments.length
  end

  def edit
    @movie_comment = MovieComment.find(params[:id])
  end

  def update
    @movie_comment = MovieComment.find(params[:id])
    @movie = @movie_comment.movie_id
    if @movie_comment.update(movie_comment_params)
      redirect_to movie_path(@movie)
    end
  end

  def destroy
    @movie_comment = MovieComment.find(params[:id])
    @movie_comment.destroy
    # 非同期通信
    movie_id = @movie_comment.movie_id
    movie_comments = MovieComment.where(movie_id: movie_id)
    @mymovie_comment = movie_comments.where(user_id: current_user.id)
    @othermovie_comments = movie_comments.where.not(user_id: current_user.id)

    # 非同期通信時の映画平均点の計算
    ratesum = 0
    movie_comments.each do |comment|
      ratesum += comment.rate
    end
    @average = movie_comments.length == 0 ? 0
    : ratesum / movie_comments.length
  end

  private
  def movie_comment_params
    params.require(:movie_comment).permit(:comment, :user_id, :movie_id, :rate, :spoiler_status)
  end
end