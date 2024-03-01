class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :create]

  def index
    # @bookings = Booking.all
    @bookings = current_user.bookings
  end

  def show
    @booking_duration = (@booking.end_date - @booking.start_date)/60/60/24
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new()
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to edit_booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
