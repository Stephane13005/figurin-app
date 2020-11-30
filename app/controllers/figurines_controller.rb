class FigurinesController < ApplicationController
	def index
		@figurines = Figurine.all
	end 

	def show
		@figurine = Figurine.find(params[:id])
	end
end
