class Restaurant < ApplicationRecord
    has_many :dishes_restaurants
    has_many :dishs, through: :dishes_restaurants
end
