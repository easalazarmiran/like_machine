require 'rails_helper'

RSpec.describe 'Likes', type: :request do


  describe 'post like' do
    let!(:user) { create(:user) }
    let!(:link) { create(:link, user: user) }

    context 'with valid params' do
      before do
        allow_any_instance_of(LikesController).to receive(:authenticate_user!).and_return(true)
        allow_any_instance_of(LikesController).to receive(:current_user).and_return(user)
        post '/likes', params: { link_id: link.id }, headers: headers
      end

      it 'returns 201 status code' do
        expect(response).to have_http_status(200)
      end
    end

     context 'with invalid params' do
      before do
        allow_any_instance_of(LikesController).to receive(:authenticate_user!).and_return(true)
        allow_any_instance_of(LikesController).to receive(:current_user).and_return(user)
        post '/likes', params: { link_id: nil }, headers: headers
      end

      it 'returns 422 status code' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
