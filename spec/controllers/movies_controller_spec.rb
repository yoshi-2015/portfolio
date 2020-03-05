require 'rails_helper'
RSpec.describe MoviesController, type: :controller do
    describe 'topページ' do
      context "topページが正しく表示される" do
        before do
          get :top
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
end
