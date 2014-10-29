#
# Template Design Pattern
#
#
#

class Template
	attr_reader :name

	def initialize(args)
		@name = args[:name]
	end

	def say_hello
		nil
	end

	def say_goodbye
		nil
	end
end

class Person < Template
	def say_hello
		puts "#{name} says \"hello\""
	end

	def say_goodbye
		puts "#{name} says \"goodbye\""
	end
end

class Dog < Template
	def say_hello
		puts "#{name} says \"woof\""
	end

	def say_goodbye
		puts "#{name} says \"woof woof\""
	end
end



if __FILE__ == $0

	puts "Template Design Pattern Example"
	puts "===============================\n\n"

	k    = Person.new(name: 'Kendra')
	sage = Dog.new(name: 'Sage')

	k.say_hello
	sage.say_hello

	k.say_goodbye
	sage.say_goodbye

end