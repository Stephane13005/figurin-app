class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params(:id))
  end

  def profile
    if current_user.profile
      @profile = current_user.profile
      @figurines = current_user.figurines
    else
      @profile = Profile.create(user: current_user)
    end
  end

  def update
    @profile = Profile.find(params[:id])
    redirect_to "/profile" if @profile.update(profile_params)
  end

  private

  def profile_params
    params.require(:profile).permit(:firstname, :lastname, :birthdate, :city, :username, :photo)
  end
end
