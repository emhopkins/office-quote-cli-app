class Character

  attr_accessor :name

	@@all = []

	def initialize(name)
		@name = name
		@quotes = []
		@@all << self
	end

	def add_quote(quote)
		if !@quotes.include?(quote)
		  @quotes << quote
		end
		if quote.character == nil
		  quote.character = self
		end
	end

	def quotes
		@quotes
	end

	def self.all
		@@all
	end

	def self.list_all_characters
		@@all.each do |character|
			puts character.name
		end	
	end

	def self.list_all_quotes_by_character
		@@all.each do |character|
			i = 0
			puts "Quotes for #{character.name}: "
			character.quotes.each do |quote|
				i += 1
				puts "#{i}. #{quote.content}"
			end
		end
	end

	def self.list_all_quotes_for_character(name)
		@@all.each do |character|
			i = 0
			if character.name == name
				puts "Quotes for #{character.name}: "
				character.quotes.each do |quote|
					i += 1
					puts "#{i}. #{quote.content}"
				end
			end
		end
	end
end