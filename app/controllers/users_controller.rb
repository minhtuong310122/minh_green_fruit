class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    redirect_to root_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation, :name
  end
end
