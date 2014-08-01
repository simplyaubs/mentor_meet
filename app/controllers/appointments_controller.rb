class AppointmentsController < ApplicationController
 #require login

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = current_user.id

    if @appointment.save
      redirect_to user_path(current_user), :notice => "Appointment successfully created!"
    else
      render :new
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update_attributes!(mentee_id: current_user.id)


    redirect_to user_path(current_user), :notice => "Session successfully booked!"
  end

  private
  def appointment_params
    Chronic.time_class = Time.zone
    {
      language: params[:appointment][:language],
      time: Chronic.parse(params[:appointment][:time])
    }
  end
end
