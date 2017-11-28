class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    @spaceships = Spaceship.all
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = User.find(params[:user_id])
    @spaceship.save
    redirect_to spaceship_path(@spaceship)
  end

  def update
    @spaceship = Spaceship.find(params[:id])
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :category, :power, :seats, :constructor, :weapons, :maxspeed, :size, :user_id)
  end
end
