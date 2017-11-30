class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    authorize @reservation
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation.spaceship = @spaceship
    @reservation.user = current_user
    @spaceship.available = "pending"
    @spaceship.save
    if @reservation.save
      redirect_to resas_user_path(@user)
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
