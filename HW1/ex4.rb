require "test/unit"

class TestDessert < Test::Unit::TestCase

	def test_create_dessert
		assert !Dessert.new("ice cream", "200").nil?
	end
	
end