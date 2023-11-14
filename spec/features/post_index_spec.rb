require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before :each do
  @user_1 = User.create!(name: 'Bashar', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.', posts_counter: 2)
  @post_1 = Post.create!(author: @user_1, title: 'First Post', text: 'First text', comments_counter: 2, likes_counter: 2)
  @post_2 = Post.create!(author: @user_1, title: 'Second Post', text: 'Second text', comments_counter: 0, likes_counter: 0)
  @comment_1 = Comment.create!(post: @post_1, author: @user_1, text: 'Hi Bashar!')
  @comment_2 = Comment.create!(post: @post_1, author: @user_1, text: 'Hi Bashar!')
  @like_1 = Like.create!(post: @post_1, author: @user_1)
  @like_2 = Like.create!(post: @post_1, author: @user_1)
  end
  describe 'Index page' do
    it "should display the user's profile picture" do
      visit user_posts_path(@user_1)
      expect(page).to have_css("img[src*='https://unsplash.com/photos/1.jpg']")
    end

    it "should display the user's username" do
      visit user_posts_path(@user_1)
      expect(page).to have_content(@user_1.name)
    end

    it "should display the user's number of posts" do
      visit user_posts_path(@user_1)
      expect(page).to have_content(@user_1.posts_counter)
    end

    it "should display the post's title" do
      visit user_posts_path(@user_1)
      expect(page).to have_content(@post_1.title)
    end

    it "should display some of the post's body" do
      visit user_posts_path(@user_1)
      expect(page).to have_content(@post_1.text)
    end

    it "should display the first comments on a post" do
      visit user_posts_path(@user_1)
      expect(page).to have_content(@comment_1.text)
      expect(page).to have_content(@comment_2.text)
    end

    it "should display the number of comments on a post" do
      visit user_posts_path(@user_1)
      expect(page).to have_content(@post_1.comments_counter)
    end

    it "should display the number of likes on a post" do
      visit user_posts_path(@user_1)
      expect(page).to have_content(@post_1.likes_counter)
    end

    it "should redirect me to that post's show page when clicking on the post's title" do
      visit user_posts_path(@user_1)
      click_link @post_1.title
      expect(page).to have_current_path(user_post_path(@user_1, @post_1))
    end

    it 'Should display the section to create a new post' do
      visit user_posts_path(@user_1)
      expect(page).to have_content('Create New Post')
    end
    
  end

end
