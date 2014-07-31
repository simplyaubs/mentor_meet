if User.count == 0
  raise "You must run the app and login w/ github first!!!"
end

Appointment.destroy_all
User.where(email: 'mentor@example.com').destroy_all

mentor = User.create!(uid: '12345',email: 'mentor@example.com', name: 'Mentor')

(1..9).each do |hour|
  Appointment.create!(
    time: "#{hour}:00",
    language: 'Ruby',
    mentor_id: mentor.id
  )
end