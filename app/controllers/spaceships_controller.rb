class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_spaceship, only: [:show, :edit, :update, :destroy]



  def index

    if params[:queries].present?
      @spaceships = Spaceship.where("category = ?", params[:queries][0])
      # @spaceships = Sapaceship.where("seats = ?", params[:queries][1])
    else
      @spaceships = Spaceship.all
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

  def edit
  end

  def update
  end


  def destroy
    @spaceship = Spaceship.find(params[:id])
    @user = current_user
    @spaceship.destroy
    redirect_to user_path(@user)
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
