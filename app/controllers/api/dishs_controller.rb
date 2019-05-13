class Api::DishsController < ApplicationController
  def index
    @dish = Dish.all.as_json(only: %i[id name])
    render json: JSON.pretty_generate(dishs: @dish)
  end

  def show
    @dish = Dish.where(id: params[:id]).as_json(only: %i[id name])
    render json: JSON.pretty_generate(dishs: @dish)
  end

  def get_restaurants
    @restaurants = Dish.where(id: params[:id]).first.restaurants.as_json(only: %i[id name])
    render json: JSON.pretty_generate(restaurants: @restaurants)
  end
end
