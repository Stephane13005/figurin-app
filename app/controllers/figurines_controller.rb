class FigurinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @figurines = Figurine.all
  end

  def show
    @figurine = Figurine.find(params[:id])
  end
end
