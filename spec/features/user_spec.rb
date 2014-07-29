require 'spec_helper'

feature 'user can sign in with GitHub' do
  scenario 'user goes to home page and logs in with GitHub' do
    visit '/'
    find('#login a').click
    mock_omniauth
    expect(page).to have_content 'Signed in!'
  end
end

feature 'user can create a mentorship session' do
  scenario 'user can create a mentorship session' do

    visit '/'
    find('#login a').click
    mock_omniauth

    click_on 'Create a Mentoring Session'
    expect(page).to have_content 'Create a Session'
  end


end
