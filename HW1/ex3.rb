require "test/unit"

class TestCombineAnagrams < Test::Unit::TestCase

	def test_simple_combine_anagrams
		assert_equals([["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]],
			combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']))
	end
	
end

def combine_anagrams(words)

end
