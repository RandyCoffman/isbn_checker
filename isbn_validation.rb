def remove_everything_but_digits_x_and_X(numbers)
	numbers = numbers.gsub(/[^0-9^xX]/, "")
end

def string_length(numbers)
	if numbers.length == 10 || numbers.length == 13
		true
	else
		false
	end
end

def string_checker(numbers)
	numbers = remove_everything_but_digits_x_and_X(numbers)
	string_length(numbers)
end

def string_to_array(numbers)
	numbers = remove_everything_but_digits_x_and_X(numbers)
	if string_length(numbers) == true
		numbers.split("")
	end
end

def validate_isbn10(numbers)
	check_digit = []
	numbers = string_to_array(numbers)
		check_digit.push(numbers.pop)
		numbers.map! { |str| 
			if str.downcase == "x"
				str = 10
			else
				str.to_i 
			end
		}
		numbers = numbers.each_with_index.map { |value,index| value * (index + 1) }
		numbers = numbers.inject(:+) # Adds the array of integers together
		if numbers % 11 == check_digit[0].to_i || check_digit[0].downcase == "x" && numbers % 11 == 10
			"valid"
		else 
			"invalid"
		end
end

def validate_isbn13(numbers)
	check_digit = []
	numbers = string_to_array(numbers)
	check_digit.push(numbers.pop)
	numbers.map! { |str| str.to_i }
	numbers = numbers.each_with_index.map { |value,index|
	if (index + 1).odd? 
		value * 1
	elsif (index + 1).even?
		value * 3
	end
	}
	numbers = numbers.inject(:+) # Adds the array of integers together
	numbers = numbers % 10
	numbers = 10 - numbers
	until numbers <= 9
		numbers = numbers % 10
	end
	if check_digit[0].to_i != numbers 
		"invalid"
	else
		"valid"
	end
end


def isbn10_or_isbn13(numbers)
	numbers = remove_everything_but_digits_x_and_X(numbers)
	if numbers.length == 10
		validate_isbn10(numbers)
	elsif numbers.length == 13
		validate_isbn13(numbers)
	else
		"invalid"
	end
end