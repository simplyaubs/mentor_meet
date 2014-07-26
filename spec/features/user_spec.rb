require 'spec_helper'

feature 'user can sign in with GitHub' do
  scenario 'user goes to home page and logs in with GitHub' do
    mock_omniauth
    visit '/'
    find('#login a').click
    expect(page).to have_content 'Signed in!'
  end
end

feature 'user can create a mentorship session' do
  pending
  scenario 'user can create a session' do
    mock_omniauth

    visit '/'


  end
end
