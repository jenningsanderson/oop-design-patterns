#
# Strategy Design Pattern
#

class Operation
	attr_reader :operation, :value
end

class Add < Operation
	def initialize
		@operation = 'add'
		@value     = :+
	end
end

class Subtract < Operation
	def initialize
		@operation = 'subtract'
		@value     = :-
	end
end

class Calculator
	attr_reader :nums, :ops

	def initialize(args)
		@nums = args[:nums]
		@ops  = args[:ops]
		if ops.length == 1
			@ops = [ops[0]] * (nums.length-1)
		end
	end

	def run
		total = nums.shift
		nums.each_with_index do |num, index|
			print "#{total} #{ops[index].operation} #{num} = "
			total = total.send( ops[index].value, num)
		end
		puts total
	end

end



if __FILE__ == $0

	puts "Running Strategy Design Pattern Example"

	nums = [1,2,3,4,5]
	ops  = [Add.new]

	calc = Calculator.new(nums: nums, ops: ops)
	calc.run


	nums = [5,3,2]
	ops  = [Add.new, Subtract.new]
	calc = Calculator.new(nums: nums, ops: ops)
	calc.run
end