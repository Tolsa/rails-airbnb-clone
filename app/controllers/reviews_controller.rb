class ReviewsController < ApplicationController
  def create
     @spaceship = Spaceship.find(params[:spaceship_id])
     @review = Review.new(review_params)
     @review.restaurant = @spaceship
     if @review.save
       redirect_to spaceship_path(@spaceship)
     else
       render 'spaceships/show'
     end
   end

   private

   def review_params
     params.require(:review).permit(:content)
   end
end
