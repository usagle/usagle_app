require 'rails_helper'

feature 'User sign in', '
	In order to be able to ask item
	As in user
	I want to be able to sign in
' do

  scenario 'Registered user try to sign in' do
    User.create!(email: 'tester@usagle.com', password: '12345678')

    visit new_user_session_path
    fill_in 'Email', with: 'tester@usagle.com'
    fill_in 'Password', with: '12345678'
    click_link 'Log in'

    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq root_path
  end

  scenario 'Non-registered user try to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@usagle.com'
    fill_in 'Password', with: '12345678'
    click_link 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq new_user_session_path
  end
end
