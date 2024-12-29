class TodoList
	def initialize
		@tasks = []
	end

	def add_task(task)
		@tasks << task
	end

	def display_tasks
		puts "Your Todo List:"
		@tasks.each_with_index do |task, index|
			puts "#{index + 1}. #{task}"
		
		end
	end

	def save_to_file(filename)
		File.open(filename, "w") do |file|
			@tasks.each { |task| file.puts(task)}
		
		end
	end
		
	def load_from_file(filename)
		if File.exist?(filename)
			@tasks = File.readlines(filename).map(&:chomp)
		end
		
	end
end

# Using the TodoList class
todo = TodoList.new
todo.load_from_file("todo.txt")
todo.add_task("Buy groceries")
todo.display_tasks
todo.save_to_file("todo.txt")