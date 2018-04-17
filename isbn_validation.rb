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
