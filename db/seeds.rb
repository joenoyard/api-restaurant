# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

restaurants = [
  {
    name: 'Yayoi',
    dishs: []
  }, {
    name: 'Amor',
    dishs: ['Fried egg']
  }, {
    name: 'MK Restaurant',
    dishs: ['Egg drop soup', 'Steamed egg']
  }, {
    name: 'HUA SENG HONG',
    dishs: ['Omelet', 'Boiled egg', 'Soft-boiled egg']
  }, {
    name: 'After You',
    dishs: ['Scrambled egg', 'Stuffed egg', 'Preserved egg', 'Salted egg']
  }
]
restaurants.map do |restaurant|
    res = Restaurant.create(name: restaurant[:name])
    arr_dish = []
    res.dishs.create(restaurant[:dishs].map{|dish| arr_dish = {name: dish}})
end