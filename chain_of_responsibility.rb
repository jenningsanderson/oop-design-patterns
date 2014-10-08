# 
# Chain of Responsibility
#
#
# Okay to use flags to determine which piece of the program gets this request
#
#
# I almost have an idea of how this works?  I think..
#
#
#

#Abstract Help Menu Handler
class HelpMenu
	attr_reader :successor
	def initiailize(args)
		@successor = args[:successor]
		@type = args[:type]
	end

	def help(help_type)
		if help_type == self.type
			run
		else
			successor.help(help_type)
		end
	end
end

#Concrete Help Menus that the program can handle
class ProgramHelp < HelpMenu
	def initialize
		super(type: 0, successor: 0)
	end
	def run
		puts "These are the help options for the Main Program:"
		puts "\tAbout ... About this program"
		puts "\tLicense.. The boring legal jargon"
	end
end

class RoutineHelp < HelpMenu
	
	def initialize
		super(type: 1, successor: 0)
	end

	def run
		puts "These are the help options for the Routine that you've called!"
		puts "\tWhy?....  Why did I run this routine?"
		puts "\tWhat?...  What does this routine do?"
	end
end

class ObjectHelp < HelpMenu
	def run
		puts "These are the help options for the object: "
		puts "\tType........ What type of object am I?"
		puts "\tAbilities... What are my abilities as an object?"
	end
end



class MyProgram
	attr_reader :name

	def initialize(args)
		@name = args[:name]
	end

	def run
		this_routine = MyRoutine.new(3)
	end
end

class MyRoutine
	attr_reader :objects
	def initialize(num)
		@objects = []
		num.times do |index|
			@objects << MyObject.new
		end
	end
end

class MyObject
end




if __FILE__ == $0
	puts "Chain of Responsibility"

	puts "Initializing an instance of MyProgram..."

	program = MyProgram.new(name: "Test Program")



end


















