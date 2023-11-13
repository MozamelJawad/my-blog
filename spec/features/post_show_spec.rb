require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before :each do
    @user_1 = User.create!(name: 'Shaheer', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.', posts_counter: 1)
    @post_1 = Post.create!(author: @user_1, title: 'First Post', text: 'First text', comments_counter: 2, likes_counter: 1)
    @comment_1 = Comment.create!(post: @post_1, author: @user_1, text: 'Hi Shaheer!')
    @comment_2 = Comment.create!(post: @post_1, author: @user_1, text: 'Hi Shaheer!')
    @like_1 = Like.create!(post: @post_1, author: @user_1)
  end

  describe 'Show page' do
    it "should display the post's title" do
      visit user_post_path(@user_1, @post_1)
      expect(page).to have_content(@post_1.title)
    end

    it "should display the post's author" do
      visit user_post_path(@user_1, @post_1)
      expect(page).to have_content(@user_1.name)
    end

    it "should display the post's number of comments" do
      visit user_post_path(@user_1, @post_1)
      expect(page).to have_content(@post_1.comments_counter)
    end

    it "should display the post's number of likes" do
      visit user_post_path(@user_1, @post_1)
      expect(page).to have_content(@post_1.likes_counter)
    end

    it "should display the post's body" do
      visit user_post_path(@user_1, @post_1)
      expect(page).to have_content(@post_1.text)
    end

    it "should display the username of each commentator" do
      visit user_post_path(@user_1, @post_1)
      expect(page).to have_content(@user_1.name)
    end

    it "should display the text of each comment" do
      visit user_post_path(@user_1, @post_1)
      expect(page).to have_content(@comment_1.text)
      expect(page).to have_content(@comment_2.text)
    end
  end
end
