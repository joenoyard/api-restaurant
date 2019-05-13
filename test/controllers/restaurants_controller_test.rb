require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  test 'can get all restaurants' do
    get '/api/restaurants'
    assert_response :success
    assert_equal Restaurant.count, JSON.parse(@response.body)['restaurants'].count
    assert_equal 'application/json', @response.content_type
  end

  test 'can get a restaurant by id' do
    @restaurant = Restaurant.create(name: 'test restaurant')
    get "/api/restaurants/#{@restaurant.id}"
    assert_response :success
    assert_equal @restaurant.id, JSON.parse(@response.body)['restaurants'][0]['id']
    assert_equal 'test restaurant', JSON.parse(@response.body)['restaurants'][0]['name']
    assert_equal 'application/json', @response.content_type
  end

  test 'can get dishs by dish id' do
    @restaurant = Restaurant.create(name: 'test restaurant')
    @dish = @restaurant.dishs.create(name: 'test dish')
    get "/api/restaurants/#{@restaurant.id}/dishs"
    assert_response :success
    assert_equal @dish.id, JSON.parse(@response.body)['dishs'][0]['id']
    assert_equal 'test dish', JSON.parse(@response.body)['dishs'][0]['name']
    assert_equal 'application/json', @response.content_type
  end
end
