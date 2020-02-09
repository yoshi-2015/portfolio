require 'rails_helper'
RSpec.describe movie_comment, type: :model do
  context "データが正しく保存される" do
    before do
      @moviecomment = MovieComment.new
      @moviecomment.comment = "Hello WebCamp"
      @moviecomment.rate = 0.0
      @moviecomment.spoiler_status = 0
      @moviecomment.save
    end
    it "全て入力してあるので保存される" do
      expect(@moviecomment).to be_valid
    end
  end
end