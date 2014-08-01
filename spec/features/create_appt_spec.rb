require 'spec_helper'

feature 'Mentorship Appointments' do
  before(:each) do
    visit root_path
    find('#login a').click
    mock_omniauth
    click_on 'Create a Mentoring Session'
  end

  scenario 'user navigates to create an appointment' do
    expect(page).to have_content 'Create a Session'
  end

  scenario 'user create appointment' do
    fill_in 'Time', with: '6:00'
    select 'Ruby', from: 'Language'
    click_on 'Create Appointment'

    expect(page).to have_content '6:00'
    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'My Dashboard'
    expect(page).to have_content 'Appointment successfully created!'
  end

end
