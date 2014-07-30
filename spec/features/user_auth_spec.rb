require 'spec_helper'

feature 'user signs in with GitHub' do
  scenario 'user goes to home page and logs in with GitHub' do
    visit root_path
    find('#login a').click
    mock_omniauth
    expect(page).to have_content 'Signed in!'
  end
end

