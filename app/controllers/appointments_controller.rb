class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to user_path(current_user), :notice => "Appointment successfully created!"
    else
      render :new
    end
  end

def book
    redirect_to user_path(current_user), :notice => "Session successfully booked!"
  end

  private
  def appointment_params
    params.require(:appointment).permit(:time, :language)
  end
end
