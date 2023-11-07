require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /index' do
    it 'returns a correct and successful response' do
      get users_path
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('Here is all users.')
    end
  end

  describe 'GET /show' do
    user = User.create(name: 'Ahmad', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kabul.')
    it 'returns a correct and successful response' do
      get user_path(user.id)
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get user_path(user.id)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_path(user.id)
      expect(response.body).to include('Here is a list of posts for a given user.')
    end
  end
end
