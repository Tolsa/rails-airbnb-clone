class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation.spaceship_id = @spaceship.id
    @reservation.user = current_user
    if @reservation.save
      redirect_to root_path
    else
      redirect_to spaceship_path(@spaceship)
    end

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to spaceship_path(@reservation.spaceship)
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end