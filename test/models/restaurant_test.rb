require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
end
