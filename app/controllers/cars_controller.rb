class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
    if params[:query].present?
      sql_subquery = <<~SQL
        cars.make @@ :query
        OR cars.model @@ :query
        OR cars.location @@ :query
      SQL
      @cars = @cars.where(sql_subquery, query: "%#{params[:query]}%")
    end

    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { car: car }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    @car.location = current_user.postcode.capitalize
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])

  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path(@car.user),status: see_other
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :price, :mileage, :location, :category, :seats, :photo, :user_id)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
