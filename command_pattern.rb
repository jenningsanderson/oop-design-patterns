#
# Command Design Pattern Implementation
# 
#
#
#
#
#
# 

#4 Separate pieces involved:

#Abstract Command Class:
class Command
	def execute()
		nil
	end

	def unexecute()
		nil
	end
end


#Concrete Commands: 
class CreateFile

	attr_reader :filename

	def initialize(file_name)
		@filename = file_name

	def execute
		File.open(filename, 'wb')
	end

	def unexecute
		File.
	end
end

class WriteLine

	def initialize(file)

	end
end




if __FILE__ == $0
	puts "Running the command pattern example"