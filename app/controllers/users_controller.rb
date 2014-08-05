class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @appointments = Appointment.all
  end

  def dashboard
    @appointments = Appointment.all
    if current_user
      @user = User.find(current_user.id)
      @user_appointments = @user.upcoming_appointments
    else
      redirect_to root_path, notice: 'Please log in'
    end
  end

end