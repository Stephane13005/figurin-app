class FigurinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show media]
  after_action :verify_authorized, except: %i[index show media], unless: :devise_controller?
  after_action :verify_policy_scoped, except: %i[index show media], unless: :devise_controller?

  def index
    @figurines = policy_scope(Figurine).order(created_at: :desc)
    if params[:query].present?
      @figurines = Figurine.search_by(params[:query])
    else
      @figurines = Figurine.all
    end
  end

  def favorite
    @favourite = Favourite.new
    authorize @favourite
    @favourite.figurine = policy_scope(Figurine).find(params[:id])
    @favourite.user = current_user
    @favourite.save
  end

  def show
    @figurine = policy_scope(Figurine).find(params[:id])
    authorize @figurine
    @review = Review.new
  end

  def media
    figurine = policy_scope(Figurine).find(params[:id])
    fetch_media(figurine.media_universe, figurine.media_year)
  end

  def fetch_media(title, year)
    require 'open-uri'
    require 'json'
    url = "http://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&t=#{title}&y=#{year}"
    response = open(url).read
    parsed_movie = JSON.parse(response)
    @movie_title = parsed_movie['Title']
    @movie_year = parsed_movie['Released']
    @movie_poster = parsed_movie['Poster']
    @movie_plot = parsed_movie['Plot']
    @movie_director = parsed_movie['Director']
    @movie_actors = parsed_movie['Actors']
    @movie_rating = parsed_movie['imdbRating']
  end

  def new
    @figurine = policy_scope(Figurine).new
    authorize @figurine
  end

  def create
    @figurine = policy_scope(Figurine).new(figurine_params)
    @figurine.user = current_user
    authorize @figurine
    if @figurine.save
      redirect_to "/profile"
    else
      render :new
    end
  end

  def edit
    @figurine = policy_scope(Figurine).find(params[:id])
    authorize @figurine
  end

  def update
    @figurine = policy_scope(Figurine).find(params[:id])
    authorize @figurine
    @figurine.update(figurine_params)

    redirect_to "/profile"
  end

  def destroy
    @figurine = policy_scope(Figurine).find(params[:id])
    authorize @figurine
    @figurine.destroy
    redirect_to "/profile"
  end

  private

  def figurine_params
    params.require(:figurine).permit(:name, :description, :year, :brand, :media_universe, :media_year, :price_cents,
                                     :photo)
  end
end
