class Api::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.as_json(only: %i[id name])
    render json: { restaurants: @restaurants }
  end

  def show
    @restaurants = Restaurant.where(id: params[:id]).as_json(only: %i[id name])
    render json: { restaurants: @restaurants }
  end

  def get_dishs
    @dish = Restaurant.where(id: params[:id]).first.dishs.as_json(only: %i[id name])
    render json: { dishs: @dish }
  end
end
