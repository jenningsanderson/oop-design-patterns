#
# Bridge Design Pattern Implementation in Ruby
#
#

#Abstract 
class Computer
	attr_reader :year
	
	def initialize(args)
		@year 		= args[:year]
		@display 	= args[:display]
	end
end

#Implementor (Also abstract)
class Display
	attr_reader :size, :make

	def initialize(args)
		@size = args[:size]
		@make = args[:make]
	end
end



#Concrete Implementations
class RetinaDisplay < Display
	def initialize(args)
		@@type = 'retina'
		super(args)
	end
end


class FourKDisplay < Display
	def initialize(args)
		@@type = '4k'
		super(args)
	end
end


#Refined Abstractions
class MacBookPro < Computer
end

class MacbookAir < Computer
end




if __FILE__ == $0

	puts "Running Bridge Pattern"

	mbp_big = MacBookPro.new(year: 2009, display: RetinaDisplay.new(size: 15, make: 'samsung'))
	
	mbp_small = MacBookPro.new(year: 2013, display: FourKDisplay.new(size: 13, make: 'vizio'))

	puts "The Big MacBookPro"
	puts mbp_big.inspect
	puts "=================="

	puts "The Small MacBookPro"
	puts mbp_small.inspect
	puts "=================="



end