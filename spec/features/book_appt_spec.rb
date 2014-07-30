require 'spec_helper'

feature 'Mentee Appointments' do
  before(:each) do
    visit root_path
    find('#login a').click
    mock_omniauth
    click_on 'Book Mentoring Session'
  end

  scenario 'user navagates to book an appointment' do
    expect(page).to have_content 'Book a Session'
  end


end