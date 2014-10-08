#
# Singleton Design Pattern Implementation
#
# Force one instance of all variables by using only class variables.
#
# Helpful reference: http://dalibornasevic.com/posts/9-ruby-singleton-pattern

class DBClient
	
	def initialize(args)
		@@server = args[:server]
		@@status = "NONE"
	end

	def status
		@@status
	end

	def server
		@@server
	end

	def connect
		puts "DBClient received the connect command..."
		@@status = "ALIVE"
	end

	def disconnect
		if @@status == "ALIVE"
			@@status = "DEAD"
		else
			puts "Error, No existing connection"
		end
	end

end


if __FILE__ == $0
	puts "Running Singleton Design Pattern Example: "

	puts "Creating a database connection: to 'epic-analytics'"
	client = DBClient.new(server: "epic-analytics")

	puts "Server: #{client.server}"
	puts "Status: #{client.status}"

	client.connect
	puts "Status is now: #{client.status}"

	puts "\nNow calling a new client with server: 'epic-collect' "
	client2 = DBClient.new(server: "epic-collect")

	puts "Server: #{client2.server}"
	puts "Status: #{client2.status}"

	puts client2.connect
	puts "Status is now: #{client2.status}"

	puts "\nBut wait!  What about the first client?"
	puts "Server: #{client.server}"
	puts "Status: #{client.status}"

	puts "\nclient was over-written by client2"

	puts "Testing for server object equality between the two clients: #{client.server === client2.server}"
	puts "Testing for status object equality between the two clients: #{client.status === client2.status}"
end



