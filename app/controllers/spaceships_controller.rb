class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:queries].present?
      @spaceships = Spaceship.where("category = ?", params[:queries][0])
      # @spaceships = Sapaceship.where("seats = ?", params[:queries][1])
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
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
    params.require(:spaceship).permit(:name, :category, :power, :seats, :constructor, :weapons, :maxspeed, :size, :user_id, :photo)
  end
end
