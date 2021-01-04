class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.figurine = policy_scope(Figurine).find(params[:figurine_id])
    if @review.save
      redirect_to figurine_path(@review.figurine, anchor: "review-#{@review.id}")
    else
      render 'figurines/show'
    end
  end

  def update
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to figurine_path(@review.figurine)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
