class MovieComment < ApplicationRecord
  # アソシエーション
  belongs_to :user

  # ネタバレステータスのenum指定
  enum spoiler_status: {無: 0, 有: 1}

  # バリデーション
  validates :comment, presence: true, length: { maximum: 500 }
  validates :rate, numericality: {
    less_than_or_equal_to: 5.0,
    greater_than_or_equal_to: 0.0
  }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end