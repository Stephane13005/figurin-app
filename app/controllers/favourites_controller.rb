class FavouritesController < ApplicationController
	def destroy
		 @favourite = policy_scope(Favourite).find(params[:id])
    authorize @favourite
    @favourite.destroy
    redirect_to "/profile"
	end
end

