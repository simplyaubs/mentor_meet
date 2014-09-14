class User < ActiveRecord::Base

  has_many :appointments, foreign_key: :mentee_id
  has_many :appointments, foreign_key: :mentor_id


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.avatar = auth["info"]["image"]
    end
  end


  def appointments
    Appointment.where("mentor_id = ? or mentee_id = ?", id, id)
  end

  def upcoming_appointments
    #what happens when there aren't appointments?
    #SQL based sort?  
    if appointments.present?
      appointments.where("time > ?", Time.now).sort_by(&:time)
    else
      []
    end
  end

  def previous_appointments
    if appointments.present?
      appointments.where("time < ?", Time.now).sort_by(&:time)
    else
      []
    end
  end

  def mentoring_appointments
    Appointment.where(mentor_id: id)
  end
end