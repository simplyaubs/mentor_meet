class Appointment < ActiveRecord::Base

  belongs_to :mentor, class_name: 'User'
  belongs_to :mentee, class_name: 'User'


  # def users
  #   {mentor: mentor, mentee: mentee}
  # end
end