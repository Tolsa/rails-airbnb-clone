class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    authorize @reservation
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation.spaceship = @spaceship
    @reservation.user = current_user
    @spaceship.available = "en attente"
    @spaceship.save
    if @reservation.save
      redirect_to resas_user_path(current_user)
    else
      redirect_to spaceship_path(@spaceship)
    end

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @spaceship = @reservation.spaceship
    @spaceship.available = "available"
    @spaceship.save
    @reservation.destroy
    redirect_to resas_user_path(@reservation.user)

  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
