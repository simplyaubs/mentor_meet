require 'spec_helper'

feature 'Mentee Appointments' do

  scenario 'user can book a mentoring appointment' do
    Appointment.create!(time: '7:00', language: 'Go')

    visit root_path
    find('#login a').click
    mock_omniauth
    click_on 'Book Mentoring Session'

    click_on 'Book Session'

    expect(page).to have_content '7:00'
    expect(page).to have_content 'Go'
    expect(page).to have_content 'My Dashboard'
    expect(page).to have_content 'Session successfully booked!'
  end

end