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

  scenario 'user can book a mentoring appointment' do
    click_on 'Book Session'

    expect(page).to have_content '7:00'
    expect(page).to have_content 'Go'
    expect(page).to have_content 'My Dashboard'
    expect(page).to have_content 'Session successfully booked!'
  end
end