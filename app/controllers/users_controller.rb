class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @appointments = Appointment.all
  end
end