require 'rails_helper'
RSpec.describe MoviesController, type: :controller do
  describe '映画検索ページ' do
    context "映画検索ページが正しく表示される" do
      before do
        get :index
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end