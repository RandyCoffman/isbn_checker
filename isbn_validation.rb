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
		numbers.map! { |str| str.to_i }
		check_digit.push(numbers.pop)
		numbers = numbers.each_with_index.map { |value,index| value * (index + 1) }
		 numbers = numbers.inject(:+) # Adds the array of integers together
		 if numbers % 11 == check_digit[0]
		 	'X'
		 else 
		 	"invalid"
		 end
	end
end