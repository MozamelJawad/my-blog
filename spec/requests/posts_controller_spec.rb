require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  user = User.create(name: 'Ahmad', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kabul.')
  post = Post.create(author: user, title: 'Mission Impossible', text: 'Fallout', likes_counter: 0, comments_counter: 0)

  describe 'GET /index' do
    it 'returns a correct and successful response' do
      get user_posts_path(user_id: user.id)
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get user_posts_path(user_id: user.id)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(user_id: user.id)
      expect(response.body).to include('Here is the username and list of comments for each post!')
    end
  end

  describe 'GET /show' do
    it 'returns a correct and successful response' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response.body).to include('Here is a separate post with its comments and the name of the post owner.')
    end
  end
end
