class CarsController < ApplicationController
  def index
    @cars = Car.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    car = Car.new(
      make: params[:make],
      model: params[:model],
      year: params[:year],
      color: params[:color]
    )
    car.save
    redirect_to "/cars/#{car.id}"
  end

  def show
    @car = Car.find(params[:id])
    render "show.html.erb"
  end

  def edit
    @car = Car.find(params[:id])
    render "edit.html.erb"
  end

  def update
    car = Car.find(params[:id])
    car.make = params[:make]
    car.model = params[:model]
    car.year = params[:year]
    car.color = params[:color]
    car.save
    redirect_to "/cars/#{car.id}"
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to "/cars"
  end
end
