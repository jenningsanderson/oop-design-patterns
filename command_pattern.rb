#
# Command Design Pattern Implementation
#
# Some ideas adapted from: https://github.com/nslocum/design-patterns-in-ruby

#Abstract Command Class: (Currently not doing much, just ensuring it doesn't blow up)
class Command
	def execute
		puts "Not implemented"
	end

	def unexecute
		puts "Not implemented"
	end
end

#Concrete Commands: 
class CreateFile < Command

	attr_reader :filename

	def initialize(args)
		@filename = args[:file]
	end

	def execute
		unless File.exists? filename
			File.new(filename)
		end
	end

	def unexecute
		File.delete(filename)
	end
end

class WriteLine < Command
	attr_reader :openfile, :to_write

	def initialize(args)
		@openfile = File.open(args[:file], 'wb')
		@to_write  = args[:line]
	end

	def execute
		@openfile.write(to_write)
	end
end


#Invoker
class CommandController
	attr_reader :commands
	def initialize(args)
		@commands = args[:commands]
	end

	def execute
		commands.each do |command|
			command.execute
		end
	end

	def unexecute
		commands.reverse.each do |command|
			command.unexecute
		end
	end
end



if __FILE__ == $0
	puts "Running the command pattern example"

	#So start a new command
	commands = CommandController.new(commands: 
		[	CreateFile.new(file: "testfile.txt"), 
			WriteLine.new(file: "testfile.txt", line: "this is the line we want")
		])

	commands.execute

	#commands.unexecute

end
