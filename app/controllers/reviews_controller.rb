class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[:new, :create]
#   def index
#     @tasks = Task.all
#   end

#   def show
#   end

  def new
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

#   def edit
#   end

#   def update
#     @task.update(task_params)
#     redirect_to task_path(@task)
#   end

#   def destroy
#     @task.destroy
#     redirect_to tasks_path
#   end

  private

#   def set_task
#     @task = Task.find(params[:id])
#   end

  def review_params
    params.require(:review).permit(:rating,:content)
  end
end
