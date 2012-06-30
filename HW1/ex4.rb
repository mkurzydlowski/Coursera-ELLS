require "test/unit"

class TestDessert < Test::Unit::TestCase

	NAME = "ice cream"
	CALORIES = 0

	def test_create
		assert !Dessert.new(NAME, CALORIES).nil?
	end
	
	def test_is_healthy
		assert Dessert.new(NAME, Dessert::HEALTHY_TRESHOLD-1).healthy?
	end
	
	def test_is_not_healthy
		assert !Dessert.new(NAME, Dessert::HEALTHY_TRESHOLD).healthy?
	end
	
	def test_is_delicious
		assert Dessert.new(NAME, CALORIES).delicious?
	end
	
end

class TestJellyBean < Test::Unit::TestCase

	NAME = "some jelly"
	CALORIES = 0

	def test_create
		assert !JellyBean.new(NAME, CALORIES, "some flavor").nil?
	end
	
	def test_is_not_delicious
		assert !JellyBean.new(NAME, CALORIES, JellyBean::BAD_FLAVOR).delicious?
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

class JellyBean < Dessert

	BAD_FLAVOR = "black licorice"

	attr_accessor :flavor

	def initialize(name, calories, flavor)
		super(name, calories)
		@flavor = flavor
	end
	
	def delicious?
		flavor == BAD_FLAVOR ? false : super
	end

end
