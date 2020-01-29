class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  #　今回は1:Nにおいて、1が削除されたら関連するNも削除
  has_many :movie_comments, dependent: :destroy

  # refile magic
  attachment :profile_image

  #　フォローする側、される側ふた通りの中間テーブルの名前を再定義
  #　has_many :active_relationships, class_name: "Relationship"
  #　has_many :passive_relationships, class_name: "Relationship"
  #　↑はNG 親モデルの外部キーがなんなのかという情報が足りない
  #　:foreign_key - 参照先のテーブルの外部キーのカラム名を指定できる

  #　自分がフォローしているユーザーとの関連
  #　フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  #　中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower
  #

  #　自分がフォローされるユーザーとの関連　ここから
  #　フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。そのため親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介し「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  #　むずかしいー
  #　ここまで

  def followed_by?(user)
    #　今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、
    #　引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end
end
