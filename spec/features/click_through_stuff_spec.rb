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

  it 'will let a user login' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_on "Log out"
    expect(page).to have_content "Signed out successfully"
  end
end
