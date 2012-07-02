require "test/unit"

class Class

	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s # make sure it's a string
		attr_history = attr_name+"_history"
		attr_reader attr_name # create the attribute's getter
		attr_reader attr_history # create bar_history getter
		class_eval %Q{
			def #{attr_name}=(val)
				@#{attr_history} = [nil] if @#{attr_history}.nil?
				@#{attr_history} = @#{attr_history}.push(val)
				@#{attr_name} = val
			end
		}
	end

end

class TestAttrAccWithHistory < Test::Unit::TestCase

	class Foo
		attr_accessor_with_history :bar
	end

	def test_sample_usage
		f = Foo.new
		f.bar = 3
		f.bar = :wowzo
		f.bar = 'boo!'
		assert_equal([nil, 3, :wowzo, 'boo!'], f.bar_history)
	end
	
end

class Numeric

	@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

	class << self
		attr_reader :currencies
	end
	
	def method_missing(method_id)
		singular_currency = method_id.to_s.gsub( /s$/, '')
		if Numeric.currencies.has_key?(singular_currency)
			self * Numeric.currencies[singular_currency]
		else
			super
		end
	end
	
	def in(currency)
		singular_currency = currency.to_s.gsub( /s$/, '')
		if Numeric.currencies.has_key?(singular_currency)
			self / Numeric.currencies[singular_currency]
		else
			raise WrongCurrency
		end
	end
	
end

class NoSuchCurrencyError < StandardError ; end

class TestAttrAccWithHistory < Test::Unit::TestCase

	def test_dollars_in_euro
		assert_equal(5.dollars/Numeric.currencies['euro'], 5.dollars.in(:euros))
	end
	
	def test_euros_in_rupees
		assert_equal(10.euros/Numeric.currencies['rupee'], 10.euros.in(:rupees))
	end

end

class String
	def palindrome?
		normalized = self.downcase.gsub(/\W/, '')
		normalized == normalized.reverse
	end
end

module Enumerable
	def palindrome?
		array = self.to_a
		array == array.reverse
	end
end

class TestPalindrome < Test::Unit::TestCase

	def test_is_palindrome
		assert "A man, a plan, a canal -- Panama".palindrome?
		assert "Madam, I'm Adam!".palindrome?
	end
	
	def test_is_not_palindrome
		assert !"Abracadabra".palindrome?
	end
	
	def test_enumerable_is_palindrome
		assert [1,2,3,2,1].palindrome?
	end
	
end
