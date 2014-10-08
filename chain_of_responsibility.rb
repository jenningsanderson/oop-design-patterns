# 
# Chain of Responsibility
#
#
# Okay to use flags to determine which piece of the program gets this request?
# => Instead of using flags, I just created new instances of the class
# 
# => Not the cleanest, but it works...
#
# => This is better: 
# => http://www.devinterface.com/blog/en/2010/07/design-patterns-in-ruby-chain-of-responsibility/



#Abstract Help Menu Handler
class HelpMenu
	attr_reader :sucessor
	def initialize(args)
		@successor = args[:successor]
	end

	def help(help_type)
		if help_type == self.class
			run
		else
			@successor.help(help_type)
		end
	end
end


#Concrete Help Menus that the program can handle
class HelpError < HelpMenu
	def initialize
		nil #This is just an over-ride
	end

	def help(args)
		puts "There is no help available at this level"
	end
end

class ProgramHelp < HelpMenu
	def initialize
		super(successor: HelpError.new)
	end

	def run
		puts "These are the help options for the Main Program:"
		puts "\tAbout ... About this program"
		puts "\tLicense.. The boring legal jargon"
	end
end



class RoutineHelp < HelpMenu
	def initialize
		super(successor: ProgramHelp.new)
	end

	def run
		puts "These are the help options for the Routine that you've called!"
		puts "\tWhy?....  Why did I run this routine?"
		puts "\tWhat?...  What does this routine do?"
	end
end

class ObjectHelp < HelpMenu
	def initialize
		super(successor: RoutineHelp.new)
	end

	def run
		puts "These are the help options for the object: "
		puts "\tType........ What type of object am I?"
		puts "\tAbilities... What are my abilities as an object?"
	end
end


module Helpable
	def help(type)
		@helpmenu.help(type)
	end
end



class MyProgram
	include Helpable
	attr_reader :name, :this_routine

	def initialize(args)
		@name = args[:name]
		@helpmenu = ProgramHelp.new
	end

	def run
		@this_routine = MyRoutine.new(3)
	end
end



class MyRoutine
	include Helpable
	attr_reader :objects
	
	def initialize(num)
		@objects = []
		num.times do |index|
			@objects << MyObject.new
		end
		@helpmenu = RoutineHelp.new
	end
end


class MyObject
	include Helpable
	def initialize
		@helpmenu = ObjectHelp.new
	end
end



if __FILE__ == $0
	puts "Chain of Responsibility"

	puts "Initializing an instance of MyProgram..."

	program = MyProgram.new(name: "Test Program")
	program.run

	puts "The main program caling all versions of Help:"
	puts "============================================="
	puts program.help(ProgramHelp)
	puts program.help(RoutineHelp)
	puts program.help(ObjectHelp)

	puts "The Routine calling all versions of Help:"
	puts "========================================"
	puts program.this_routine.help(ProgramHelp)
	puts program.this_routine.help(RoutineHelp)
	puts program.this_routine.help(ObjectHelp)


	puts "The Object calling all versions of Help:"
	puts "========================================"
	puts program.this_routine.objects.first.help(ProgramHelp)
	puts program.this_routine.objects.first.help(RoutineHelp)
	puts program.this_routine.objects.first.help(ObjectHelp)

end


















