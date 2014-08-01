class User < ActiveRecord::Base

  has_many :appointments, foreign_key: :mentee_id
  has_many :appointments, foreign_key: :mentor_id


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end


  def appointments
    Appointment.where("mentor_id = ? or mentee_id = ?", id, id)
  end

  def mentoring_appointments
    Appointment.where(mentor_id: id)
  end
end