class OfficeQuoteController

	def initialize
		quotes = Scraper.new
		quotes.get_quote_pages
		start_cli
		# Quote.list_all_quotes
		# Character.list_all_characters
		# Character.list_all_quotes_by_character
	end

	def start_cli
		input = ""
		puts "Welcome to The Office Quote Generator"
		while input != "exit" do
			puts "If you'd like to exit, enter \"exit\""
			puts "Please select from the following options: "
			puts "1. Choose a quote from a specific character"
			puts "2. Hear a dialouge quote (between multiple characters)"
			puts "3. Hear a random quote"
			input = gets.chomp
			if input == "1"
				get_quotes_by_character
				puts "1"
			elsif input == "2"
				puts "2"
			elsif input == "3"
				puts "3e"
			elsif input != "exit"
				puts "Please enter 1, 2 or 3"
			end
		end
	end

	def get_quotes_by_character
		input = ""
		while input != "exit" && input != "n" && input != "N" do
			puts "You may choose from these characters: "
			Character.list_all_characters
			puts "Please select from one of the following characters by entering their name: "
			input = gets.chomp
			puts "Would you like to hear 1 or all of their quotes?"
			puts "Enter \"1\" for one quote and anything else to hear all."
			option = gets.chomp
			if option != "1"
				Character.list_all_quotes_for_character(input)
			else
				Character.random_quote_for_character(input)
			end
			puts "Would you like to choose another character? (y/n)"
			input = gets.chomp
		end


	end

end