require "minitest/autorun"
require_relative "isbn_validation.rb"

class Random_pairs_test < Minitest::Test

	def test_boolean
		assert_equal(true, true)
	end

	def test_no_spaces
		nothing = remove_everything_but_digits_x_and_X("1 2 3")
		assert_equal("123", nothing)
	end

	def test_no_spaces2
		nothing = remove_everything_but_digits_x_and_X("4 5 9 10")
		assert_equal("45910", nothing)
	end

	def test_no_dashes
		nothing = remove_everything_but_digits_x_and_X("4-5-9-10")
		assert_equal("45910", nothing)
	end

	def test_no_spaces_and_dashes
		nothing = remove_everything_but_digits_x_and_X("1- 2- 3")
		assert_equal("123", nothing)
	end

	def test_length
		string = string_length("123456789")
		assert_equal(false, string)
	end

	def test_length2
		string = string_length("0123456789")
		assert_equal(true, string)
	end

	def test_checker
		checker = string_checker("1-2-3-4-5-6-7")
		assert_equal(false, checker)
	end

	def test_checker2
		checker = string_checker("98-7977-978-9")
		assert_equal(true, checker)
	end

	def test_array
		array = string_to_array("98-7977-978-9")
		assert_equal(["9","8","7","9","7","7","9","7","8","9"], array)
	end

	def test_array2
		array = string_to_array("1234567890")
		assert_equal(["1","2","3","4","5","6","7","8","9","0"], array)
	end


	def test_isbn10_validation
		array = validate_isbn10("98-7977-978-9")
		assert_equal("valid", array)
	end

	def test_isbn10_validation2
		array = validate_isbn10("877195869x")
		assert_equal("valid", array)
	end

	def test_isbn10_validation3
		array = validate_isbn10("1234567891")
		assert_equal("invalid", array)
	end

	def test_isbn10_validation4
		array = validate_isbn10("0-3211@4653-0")
		assert_equal("valid", array)
	end

	def test_isbn10_validation5
		array = validate_isbn10("10-32x1@653-0")
		assert_equal("invalid", array)
	end

	def test_isbn10_validation6
		array = validate_isbn10("xx-xxxx-xxx-x")
		assert_equal("valid", array)
	end

	def test_isbn13_validation
		array = validate_isbn13("1234567891234")
		assert_equal("invalid", array)
	end

	def test_isbn13_validation2
		array = validate_isbn13("9780470059029")
		assert_equal("valid", array)
	end

	def test_isbn13_validation3
		array = validate_isbn13("978 0 471 48648 0")
		assert_equal("valid", array)
	end

	def test_isbn10_or_isbn13_its_13
		which_one = isbn10_or_isbn13("978 0 471 48648 0")
		assert_equal("valid", which_one)
	end

	def test_isbn10_or_isbn13_its_10
		which_one = isbn10_or_isbn13("877195869x")
		assert_equal("valid", which_one)
	end
end