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
