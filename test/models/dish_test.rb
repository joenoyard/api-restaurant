require 'test_helper'

class DishTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
end
