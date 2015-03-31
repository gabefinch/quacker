require 'rails_helper'

describe 'user login and logout' do
  it 'will let a user login' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on "login_button"
    expect(page).to have_content "Signed in successfully"
  end

  it 'will let a user logout' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_on "Log out"
    expect(page).to have_content "Signed out successfully"
  end
end

describe 'quacking' do
  it 'will post a quack', js: true do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit quacks_path
    save_screenshot('../file.png')
    click_button 'Quack'
    fill_in 'Body', :with => 'Whassup all my hens?!'
    click_button 'Quack'
    expect(page).to have_content 'less than a minute ago'
  end
end
