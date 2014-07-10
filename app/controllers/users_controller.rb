class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_for_user)
    if @user.save
      redirect_to login_path, notice: 'Thanks for Registering'
    else
      redirect_to register_path, notice: @user.errors.messages
    end
  end

  private

  def params_for_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end