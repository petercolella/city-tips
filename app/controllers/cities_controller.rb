class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @posts = @city.posts
  end
  #
  # def create
  # end
  #
  # def update
  # end
  #
  # def delete
  # end
end
