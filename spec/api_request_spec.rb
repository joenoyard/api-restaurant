# frozen_string_literal: true

require 'rails_helper'

describe 'post a question route', type: :request do
  context 'API Dishs' do
    context 'get all dishs' do
      let!(:dishs) { FactoryBot.create_list(:dish, 20) }
      before { get '/api/dishs' }

      it 'returns all dishs' do
        expect(JSON.parse(response.body)['dishs'].size).to eq(20)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'get a dish' do
      let!(:dishs) { FactoryBot.create(:dish, name: 'test') }
      before { get '/api/dishs' }

      it 'returns dish name' do
        expect(JSON.parse(response.body)['dishs'][0]['name']).to eq('test')
      end

      it 'returns dish size' do
        expect(JSON.parse(response.body)['dishs'].size).to eq(1)
      end
    end

    context 'get a dish by id' do
      let!(:dishs) { FactoryBot.create(:dish, name: 'test') }
      before { get "/api/dishs/#{dishs.id}" }

      it 'returns dish id' do
        expect(JSON.parse(response.body)['dishs'][0]['id']).to eq(dishs.id)
      end

      it 'returns dish name' do
        expect(JSON.parse(response.body)['dishs'][0]['name']).to eq('test')
      end

      it 'returns dish size' do
        expect(JSON.parse(response.body)['dishs'].size).to eq(1)
      end
    end

    context 'get restaurants by dish id' do
      before do
        @restaurant = FactoryBot.create(:restaurant, name: 'test restaurant')
        @dish = @restaurant.dishs.create(name: 'test dish')
        get "/api/dishs/#{Dish.last.id}/restaurants"
      end

      it 'returns restaurants id' do
        expect(JSON.parse(response.body)['restaurants'][0]['id']).to eq(@restaurant.id)
      end

      it 'returns restaurants name' do
        expect(JSON.parse(response.body)['restaurants'][0]['name']).to eq('test restaurant')
      end

      it 'returns restaurants size' do
        expect(JSON.parse(response.body)['restaurants'].size).to eq(1)
      end
    end
  end

  context 'API Restaurants' do
    context 'get all dishs' do
      let!(:restaurants) { FactoryBot.create_list(:restaurant, 20) }
      before { get '/api/restaurants' }

      it 'returns all dishs' do
        expect(JSON.parse(response.body)['restaurants'].size).to eq(20)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'get a restaurant' do
      let!(:restaurants) { FactoryBot.create(:restaurant, name: 'test') }
      before { get '/api/restaurants' }

      it 'returns restaurant name' do
        expect(JSON.parse(response.body)['restaurants'][0]['name']).to eq('test')
      end

      it 'returns restaurant size' do
        expect(JSON.parse(response.body)['restaurants'].size).to eq(1)
      end
    end

    context 'get a restaurant by id' do
      let!(:restaurants) { FactoryBot.create(:restaurant, name: 'test') }
      before { get "/api/restaurants/#{restaurants.id}" }

      it 'returns restaurant id' do
        expect(JSON.parse(response.body)['restaurants'][0]['id']).to eq(restaurants.id)
      end

      it 'returns restaurant name' do
        expect(JSON.parse(response.body)['restaurants'][0]['name']).to eq('test')
      end

      it 'returns restaurant size' do
        expect(JSON.parse(response.body)['restaurants'].size).to eq(1)
      end
    end

    context 'get dishs by restaurants id' do
      before do
        @restaurant = FactoryBot.create(:restaurant, name: 'test restaurants')
        @dish = @restaurant.dishs.create(name: 'test dishs')
        get "/api/restaurants/#{@restaurant.id}/dishs"
      end

      it 'returns dish id' do
        expect(JSON.parse(response.body)['dishs'][0]['id']).to eq(@dish.id)
      end

      it 'returns dish name' do
        expect(JSON.parse(response.body)['dishs'][0]['name']).to eq('test dishs')
      end

      it 'returns dish size' do
        expect(JSON.parse(response.body)['dishs'].size).to eq(1)
      end
    end
  end
end
