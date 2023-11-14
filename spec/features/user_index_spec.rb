require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Zia', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.',
                          posts_counter: 3)
    @user2 = User.create!(name: 'Ali', photo: 'https://unsplash.com/photos/2.jpg', bio: 'Teacher from Mexico.',
                          posts_counter: 2)
    @user3 = User.create!(name: 'Rashid', photo: 'https://unsplash.com/photos/3.jpg', bio: 'Teacher from Mexico.',
                          posts_counter: 0)
  end

  describe 'index page' do
    it 'should display the username of all other users' do
      visit users_path
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end

    it 'should display the profile photo of all other users' do
      visit users_path
      expect(page).to have_css("img[src*='https://unsplash.com/photos/1.jpg']")
      expect(page).to have_css("img[src*='https://unsplash.com/photos/2.jpg']")
      expect(page).to have_css("img[src*='https://unsplash.com/photos/3.jpg']")
    end

    it 'should display the number of posts of all other users' do
      visit users_path
      expect(page).to have_content(@user1.posts_counter)
      expect(page).to have_content(@user2.posts_counter)
      expect(page).to have_content(@user3.posts_counter)
    end

    it 'should redirect to that users show page when clicking on the username' do
      visit users_path
      click_link @user1.name
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end
