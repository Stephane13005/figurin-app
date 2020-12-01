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

  def edit
    @figurine = Figurine.find(params[:id])
  end

  def update
    @figurine = Figurine.find(params[:id])
    @figurine.update(figurine_params)
    redirect_to "/profile"
  end

  def destroy
    @figurine = Figurine.find(params[:id])
    @figurine.destroy
    redirect_to "/profile"
  end

  private

  def figurine_params
    params.require(:figurine).permit(:name, :description, :year, :brand, :photo)
  end
end
