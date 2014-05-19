require 'spec_helper'

feature 'user can go to home page' do
  scenario 'user goes to homepage and sees welcome' do
    visit '/'

    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'Sign up'
  end
end

feature 'user can register' do
  scenario 'user goes to register page and creates account' do
    visit '/'
    click_on 'Sign up'
    fill_in 'First name', with: 'Tina'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'tina@smith.com'
    click_on 'Register'
    expect(User.find_by_email('tina@smith.com')).to_not eq nil
    expect(page).to have_content 'Thanks for registering!'
  end
end