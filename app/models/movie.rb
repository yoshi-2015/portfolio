class Movie < ApplicationRecord
  include HTTParty

  # default_options.update(verify: false) # disable SSL verification(必要に応じて)
  default_params api_key: '2df9c4a4aab4aebe0af4aec0d7a9e69e', language: 'ja-JP' #共通パラメタ
  format :json

  # キーワードによる検索機能
  # https://developers.themoviedb.org/3/search/search-keywordsを参照
  def self.search term
    base_uri 'https://api.themoviedb.org/3/search/movie'
    get("", query: { query: term }) # {}の中身はパラメタ
  end

  def self.newdetails id
    base_uri "https://api.themoviedb.org/3/movie/now_playing"
    get("", query: { } ) #パラメタなし
  end

  # 指定の映画の詳細情報を取得
  # https://developers.themoviedb.org/3/movies/get-movie-detailsを参照
  def self.details id
    base_uri "https://api.themoviedb.org/3/movie/#{id}"
    get("", query: { } ) #パラメタなし
  end
  # を参照
  def self.castdetails id
    base_uri "https://api.themoviedb.org/3/movie/#{id}/credits"
    get("", query: { } ) #パラメタなし
  end
end
