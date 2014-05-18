require 'spec_helper'

feature 'user can go to home page' do
  scenario 'user goes to homepage and sees welcome' do
    visit '/'

    expect(page).to have_content 'Welcome'
  end
end