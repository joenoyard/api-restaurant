class Dish < ApplicationRecord
    has_many :dishes_restaurants
    has_many :restaurants, through: :dishes_restaurants
end
