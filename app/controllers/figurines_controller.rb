class FigurinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:figurines_filter].present?
      @figurines = Figurine.search_by(params[:figurines_filter][:search])
    else
      @figurines = Figurine.all
    end
  end

  def show
    @figurine = Figurine.find(params[:id])
  end

  def media
    figurine = Figurine.find(params[:id])
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
    params.require(:figurine).permit(:name, :description, :year, :brand, :media_universe, :media_year, :photo)
  end
end
