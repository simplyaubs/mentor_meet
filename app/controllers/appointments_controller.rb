class AppointmentsController < ApplicationController
  #require login

  def index
    @appointments = Appointment.where(mentee_id: nil).where.not(mentor_id: current_user)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to dashboard_path, :notice => "Appointment successfully created!"
    else
      render :new
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update_attributes!(mentee_id: current_user.id)


    redirect_to dashboard_path, :notice => "Session successfully booked!"
  end

  private
  def appointment_params
    Chronic.time_class = Time.zone
    {
      language: params[:appointment][:language],
      time: Chronic.parse(params[:appointment][:time]),
      mentor_id: current_user.id,
    }
  end
end
