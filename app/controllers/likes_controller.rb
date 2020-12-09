class LikesController < ApplicationController
    before_action :find_figurine
    before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @figurine.likes.create(user_id: current_user.id)
      #redirect_back(fallback_location: :back)
      redirect_to figurines_path(@figurine.likes, anchor:"like-#{@figurine.id}")
    end
  end

  def find_like
    @like = @figurine.likes.find(params[:id])
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
      #redirect_back(fallback_location: :back)
      redirect_to figurines_path(@figurine.likes, anchor:"like-#{@figurine.id}")
    end
  end
  
  private

  def already_liked?
    Like.where(user_id: current_user.id, figurine_id:
    params[:figurine_id]).exists?
  end

  def find_figurine
    @figurine = Figurine.find(params[:figurine_id])
  end

end
