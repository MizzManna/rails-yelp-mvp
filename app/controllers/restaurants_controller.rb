class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

#   def edit
#     @restaurant = restaurant.find(params[:id])
#   end

#   def update
#     @restaurant = restaurant.find(params[:id])
#     @restaurant.update(restaurant_params)
#     redirect_to restaurant_path(@restaurant)
#   end

#   def destroy
#     @restaurant = restaurant.find(params[:id])
#     @restaurant.destroy
#     redirect_to restaurants_path
#   end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
# end
end
