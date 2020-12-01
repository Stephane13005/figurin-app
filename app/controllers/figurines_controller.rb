class FigurinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @figurines = Figurine.all
  end

  def show
    @figurine = Figurine.find(params[:id])
  end

  def new
    @figurine = Figurine.new
  end

  def create
    @figurine = Figurine.new(figurine_params)
    @figurine.user = current_user
    if @figurine.save
      redirect_to "/profile"
    else
      render :new
    end
  end

  private

  def figurine_params
    params.require(:figurine).permit(:name, :description, :year, :branc, :photo)
  end
end
