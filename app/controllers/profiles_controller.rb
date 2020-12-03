class ProfilesController < ApplicationController
    skip_before_action :authenticate_user!, only: :show
  after_action :verify_authorized, except: :show, unless: :devise_controller?
  after_action :verify_policy_scoped, except: :show, unless: :devise_controller?
  

def index
  @profiles = Profile.all
end

  def show
    @user = User.find(params[:id])
  end

  def profile
    if current_user.profile
      @profile = current_user.profile
      authorize @profile
    else
      @profile = Profile.create(user: current_user)
      authorize @profile
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
