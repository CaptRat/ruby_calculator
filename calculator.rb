def clear
	@first_num = nil
	@operator = nil
	@second_num = nil
	submit_number
end

def quit
	puts "Thank you for using the calculator"
	exit(0)
end

def check_input(input)
	if input.match (/clear/i)
		clear
	elsif input.match (/quit/i)
		quit
	end
end

def submit_number
	if @operator
		puts "Enter your second number:"
	else
		puts "Welcome to the Ruby calculator"
		puts "(type 'clear' or 'quit' at any time) \n \n"
		puts "Enter your first number:"
	end
	input = gets.strip
	check_input(input)
	check_number(input)
end

def check_number(input)
	if input.match (/^[-+]?\d*\.?\d+$/)
		if @operator
			@second_num = input.to_f
			calculation
		else 
			@first_num = input.to_f
			get_operator
		end
	else
		puts "\"#{input}\" is not a valid input.  Please re-enter"
    submit_number
	end
end

def get_operator
	puts "So, starting with #{@first_num}..."
	puts "Enter your operator:"
	@operator = gets.chomp
	check_input(@operator)
	operators = ['+', '-', '*', '/']
	if operators.include? @operator
		submit_number
	else
		puts "Error: please choose +, -, /, *"
		get_operator
	end
end

def calculation
	case @operator
	  when '+'
	  	result = @first_num + @second_num
	  when '-'
	  	result = @first_num - @second_num
	  when '/'
			if @second_num == 0	
				puts "you may not divide by zero.  Pick another denominator"
				submit_number 
			end
			result = @first_num / @second_num
	  when '*'
			result = @first_num * @second_num
	  else
	  	puts "Operator not supported."
	  	get_operator
		end
		puts "Your  answer for #{@first_num} #{@operator} #{@second_num} = #{result} \n \n"
		@first_num = result
		get_operator
end

submit_number
