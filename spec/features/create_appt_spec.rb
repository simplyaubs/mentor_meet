require 'spec_helper'

feature 'Mentorship Appointments' do
  before(:each) do
    visit root_path
    find('#login a').click
    mock_omniauth
    click_on 'Give Help (Mentor)'
  end

  scenario 'user navigates to create an appointment' do
    expect(page).to have_content 'Create a Session'
  end

  scenario 'user create appointment' do
    fill_in 'Time', with: 'tomorrow 6:00pm'
    select 'Ruby', from: 'Language'
    click_on 'Create Session'

    expect(page).to have_content Chronic.parse('tomorrow 6:00pm').strftime("%A, %B %e, %Y")
    expect(page).to have_content '6:00pm'
    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'My Dashboard'
    expect(page).to have_content 'Appointment successfully created!'
  end

end
