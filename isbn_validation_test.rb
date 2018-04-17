require "minitest/autorun"
require_relative "isbn_validation.rb"

class Random_pairs_test < Minitest::Test

	def test_boolean
		assert_equal(true, true)
	end

	def test_no_spaces
		nothing = remove_spaces("1 2 3")
		assert_equal("123", nothing)
	end

	def test_no_spaces2
		nothing = remove_spaces("4 5 9 10")
		assert_equal("45910", nothing)
	end

	def test_no_dashes
		nothing = remove_dashes("4-5-9-10")
		assert_equal("45910", nothing)
	end

	def test_no_dashes2
		nothing = remove_dashes("1-2-3")
		assert_equal("123", nothing)
	end
end