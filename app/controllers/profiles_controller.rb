class ProfilesController < ApplicationController
	
	def show
		@user = User.find(params[:user_id])
		@profile = Profile.find(params[:id])
	end


	def new
		@profile = Profile.new
		@user = User.find(params[:user_id])
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user = User.find(params[:user_id])
		if @profile.save
			redirect_to user_profile_path(@profile)
		else
			render :new
		end
	end

	private

	def profile_params
		params.require(:profile).permit(:firstname, :lastname, :birthdate, :city, :username, :photo)
	end
end
