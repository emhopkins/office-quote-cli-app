class Character

  attr_accessor :name

	@@all = []

	def initialize(name)
		@name = name
		@quotes = []
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

end