require "test/unit"

def palindrome?(string)
	normalized = string.downcase.gsub(/\W/, '')
	normalized == normalized.reverse
end

class TestPalindrome < Test::Unit::TestCase

	def test_is_palindrome
		assert palindrome? "A man, a plan, a canal -- Panama"
		assert palindrome? "Madam, I'm Adam!"
	end
	
	def test_is_not_palindrome
		assert !palindrome?("Abracadabra")
	end
	
end

def count_words(string)
	counts = Hash.new { default = 0 }
	string.scan(/\b\w+\b/) do |m|
		counts[m.downcase] += 1
	end
	counts
end

class TestCountWords < Test::Unit::TestCase

	def test_simple
		assert_equal(
			{'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1},
			count_words("A man, a plan, a canal -- Panama") )
		assert_equal( {'doo' => 3, 'bee' => 2}, count_words("Doo bee doo bee doo") )
	end
	
end
