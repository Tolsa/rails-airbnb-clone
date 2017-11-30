class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_spaceship, only: [:show, :edit, :update]




  def index

    if params[:planet].present?
      @spaceships_all = Spaceship.search_by_category_and_planet(params[:planet])
    elsif params[:category].present?
      @spaceships_all = Spaceship.search_by_category_and_planet(params[:category])
    elsif params[:seats].present?
      @spaceships_all = Spaceship.where("#{:seats} >= #{params[:seats]}")
    else
      @spaceships_all = Spaceship.all
    end

    @spaceships = policy_scope(Spaceship)
    # pas de authorize et policy_scope volontaires
    # Likewise, Pundit also adds verify_policy_scoped to your controller.
    # This will raise an exception similar to verify_authorized.
    # However, it tracks if policy_scope is used instead of authorize.
    # This is mostly useful for controller actions like index which find collections with a scope and don't authorize individual instances.

  end


  def show
    @reservation = Reservation.new
   # Optionnel car réalisé dans la méthode private plus bas
   # @spaceship = Spaceship.find(params[:id])
  end

  def new
    @spaceship = Spaceship.new
    authorize @spaceship
  end

  def edit
    @spaceship = Spaceship.new
    authorize @spaceship
    @spaceship = Spaceship.find(params[:id])
  end


  def create
    @spaceship = Spaceship.new(spaceship_params)
    authorize @spaceship
    @spaceship.user = current_user
    @spaceship.save
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new
    end
  end

  def update
    @spaceship = Spaceship.find(params[:id])
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :category, :price, :seats, :constructor, :weapons, :maxspeed, :planet, :user_id, :photo)
  end

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
    authorize @spaceship
  end
end
