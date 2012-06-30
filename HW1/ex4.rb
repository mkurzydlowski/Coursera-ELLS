require "test/unit"

class TestDessert < Test::Unit::TestCase

	name = "ice cream"

	def test_create_dessert
		assert !Dessert.new(@name, 200).nil?
	end
	
	def test_is_healthy
		assert Dessert.new(@name, 199).healthy?
	end
	
	def test_is_not_healthy
		assert !Dessert.new(@name, 200).healthy?
	end
	
	def test_is_delicious
		assert Dessert.new(@name, 0).delicious?
	end
	
end

class Dessert

	HEALTHY_TRESHOLD = 200

	attr_accessor :name, :calories

	def initialize(name, calories)
		@name = name
		@calories = calories
	end
	
	def healthy?
		@calories < HEALTHY_TRESHOLD
	end
	
	def delicious?
		true
	end

end