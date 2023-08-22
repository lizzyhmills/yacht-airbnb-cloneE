class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @yachts = Yacht.all
  end

  def show
    @yacht = Yacht.find(params[:id])
    @user = current_user
    @booking = Booking.new

  end

  def new

  end

  def create
    @yacht = Yacht.new(yacht_params)
    if @yacht.save
      redirect_to yacht_path(@yacht)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def yacht_params
    params.require(:yacht).permit(:capacity, :price_per_night, :name, :description, :location, :amenities)
  end

end
