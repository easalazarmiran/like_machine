require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  let(:user) { create(:user) }
  let!(:links) { create_list(:link, 20, user_id: user.id ) }
  let(:headers) { valid_headers }

  describe 'index' do
    before { get :index }

    it 'should return status code 200 ' do
      expect(response).to have_http_status(200)
    end

  end

  describe 'post link' do
    context 'with valid params' do
      before do
        allow_any_instance_of(LikesController).to receive(:authenticate_user!).and_return(true)
        allow_any_instance_of(LikesController).to receive(:current_user).and_return(user)
        post :create, params: { title: 'hello', url: 'https://helloword.com' }
      end

      it 'should have response 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
  # describe 'post like' do
  #   let(:user) { create(:user) }
  #   let!(:links) { create_list(:link, 20, user_id: user.id ) }

  #   context 'with valid params' do
  #     before do
  #       post '/likes', params: { link_id: link.id }, headers: headers
  #     end

  #     it 'creates new user' do
  #       expect(json['message']).not_to be_empty
  #     end

  #     it 'returns 201 status code' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end
  # end
end
