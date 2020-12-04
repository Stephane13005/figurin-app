class ReviewsController < ApplicationController
	def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.figurine = policy_scope(Figurine).find(params[:figurine_id])
    if @review.save
    redirect_to figurine_path(@review.figurine)
else
	render 'figurines/show'
  end
end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
