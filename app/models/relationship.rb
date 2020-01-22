class Relationship < ApplicationRecord
  # とりあえず、Userモデルと言う呼び方はやめてFollowing, Followerと言うモデル名に変更したい
  # :class_name 関連するモデルクラス名を指定。関連名と参照先のクラス名を分けたい場合に使う("元々の親モデル名"は文字列なのに注意！)
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"
end
