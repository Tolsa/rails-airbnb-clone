class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def spaceship_params
    params.require(:user).permit(:email)
  end

  def resas
    @user = User.find(params[:id])
    authorize @user
  end
end
