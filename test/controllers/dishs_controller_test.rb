# frozen_string_literal: true

require 'test_helper'

class DishsControllerTest < ActionDispatch::IntegrationTest
  test 'can get all dishs' do
    get '/api/dishs'
    assert_response :success
    assert_equal Dish.count, JSON.parse(@response.body)['dishs'].count
    assert_equal 'application/json', @response.content_type
  end

  test 'can get a dish by id' do
    @dish = @restaurant.dishs.create(name: 'test dish')
    get "/api/dishs/#{@dish.id}"
    assert_response :success
    assert_equal @dish.id, JSON.parse(@response.body)['dishs'][0]['id']
    assert_equal 'test dish', JSON.parse(@response.body)['dishs'][0]['name']
    assert_equal 'application/json', @response.content_type
  end

  test 'can get restaurants by dish id' do
    @restaurant = Restaurant.create(name: 'test restaurant')
    @dish = @restaurant.dishs.create(name: 'test dish')
    get "/api/dishs/#{@dish.id}/restaurants"
    assert_response :success
    assert_equal @restaurant.id, JSON.parse(@response.body)['restaurants'][0]['id']
    assert_equal 'test restaurant', JSON.parse(@response.body)['restaurants'][0]['name']
    assert_equal 'application/json', @response.content_type
  end
end
