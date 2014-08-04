class Appointment < ActiveRecord::Base

  belongs_to :mentor, class_name: 'User'
  belongs_to :mentee, class_name: 'User'

  validates :time, presence: true

end