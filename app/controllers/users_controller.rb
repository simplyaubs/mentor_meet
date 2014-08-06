class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])

  end

  def dashboard
    if current_user
      @appointments = Appointment.all
      @user = User.find(current_user.id)
      @user_appointments = @user.upcoming_appointments
    else
      redirect_to root_path, notice: 'Please log in'
    end
  end

end