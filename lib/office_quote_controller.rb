class OfficeQuoteController

	def initialize
		quotes = Scraper.new
		quotes.get_quote_pages
		start_cli
	end

	def start_cli
		input = ""
		puts "Welcome to The Office Quote Generator"
		while input != "exit" do
			puts "If you'd like to exit, enter \"exit\""
			puts "Please select from the following options: "
			puts "1. Choose a quote from a specific character"
			puts "2. Hear a dialogue quote (between multiple characters)"
			puts "3. Hear a random quote"
			input = gets.chomp
			if input == "1"
				get_quotes_by_character
			elsif input == "2"
				get_dialogue_quote
			elsif input == "3"
				get_random_quote
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

	def get_dialogue_quote
		input = ""
		while input != "exit" && input != "n" && input != "N" do
			Quote.get_dialogue
			puts "Would you like to hear another dialogue? (y/n)"
			input = gets.chomp
		end
	end

	def get_random_quote
		input = ""
		while input != "exit" && input != "n" && input != "N" do
			Quote.get_random
			puts "Would you like to hear another quote? (y/n)"
			input = gets.chomp
		end
	end

end