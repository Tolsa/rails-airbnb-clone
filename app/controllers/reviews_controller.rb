class ReviewsController < ApplicationController
  def create
     @spaceship = Spaceship.find(params[:spaceship_id])
     @review = Review.new(review_params)
     @review.restaurant = @spaceship
     @review.save
     if @review.save
           respond_to do |format|
             format.html { redirect_to spaceship_path(@spaceship) }
             format.js  # <-- will render `app/views/reviews/create.js.erb`
           end
         else
           respond_to do |format|
             format.html { render 'spaceships/show' }
             format.js  # <-- idem
           end
         end

   end

   private

   def review_params
     params.require(:review).permit(:content)
   end
end
