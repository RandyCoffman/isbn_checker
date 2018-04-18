def remove_spaces_and_dashes(numbers)
	numbers = numbers.gsub(" ", "")
	numbers = numbers.gsub("-", "")
end

def string_length(numbers)
	if numbers.length == 10 || numbers.length == 13
		true
	else
		false
	end
end

def string_checker(numbers)
	numbers = remove_spaces_and_dashes(numbers)
	string_length(numbers)
end

def string_to_array(numbers)
	numbers = remove_spaces_and_dashes(numbers)
	if string_length(numbers) == true
		numbers.split("")
	end
end

def validate_isbn10(numbers)
	check_digit = []
	numbers = string_to_array(numbers)
	if numbers.length == 10
		check_digit.push(numbers.pop)
		numbers.map! { |str| str.to_i }
		numbers = numbers.each_with_index.map { |value,index| value * (index + 1) }
		numbers = numbers.inject(:+) # Adds the array of integers together
		if numbers % 11 == check_digit[0].to_i || check_digit[0].downcase == "x" && numbers % 11 == 10
			"valid"
		else 
			"invalid"
		end
	end
end

def validate_isbn13(numbers)
	check_digit = []
	numbers = string_to_array(numbers)
	if numbers.length == 13
		numbers.map! { |str| str.to_i }
		check_digit.push(numbers.pop)
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
		if check_digit[0] != numbers 
			"invalid"
		else
			"valid"
		end
	end
end
