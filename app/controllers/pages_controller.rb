class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  after_action :verify_authorized, except: :home, unless: :devise_controller?
  after_action :verify_policy_scoped, except: :home, unless: :devise_controller?

  def home
  	# raise if user_signed_in?
    # @figurine = Figurine.find(5)
  end
end
