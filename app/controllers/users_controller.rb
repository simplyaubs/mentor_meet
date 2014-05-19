class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.save
    redirect_to root_path, notice: 'Thanks for registering!'
    # if user.save
    #   redirect_to login_path, notice: 'Thanks for Registering'
    # else
    #   redirect_to register_path, notice: 'Something went wrong'
    # end
  end
end