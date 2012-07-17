require "test/unit"

class TestCartesianProduct < Test::Unit::TestCase

	def test_simple_product
		c = CartesianProduct.new([:a,:b], [4,5])
		assert_equal([[:a, 4], [:a, 5], [:b, 4], [:b, 5]], c.to_a.sort)
	end
	
	def test_empty_product
		c = CartesianProduct.new([:a,:b], [])
		assert c.count == 0
	end
	
end

class CartesianProduct
	include Enumerable

	def initialize(f_it, s_it)
		@f_it = f_it
		@s_it = s_it
	end

	def each
		@f_it.each do |f_el|
			@s_it.each { |s_el| yield [f_el, s_el] }
		end
	end

end
