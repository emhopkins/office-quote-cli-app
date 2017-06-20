require 'open-uri'
require 'nokogiri'
require 'pry'

class Quote
	attr_accessor :character, :content

	@@all = []
	@@dialogue_quotes = []

	def initialize(content, character="")
		@content = content
		if character != ""
      		self.character=(character)
      	else
      		@@dialogue_quotes << self
    	end
    	@@all << self
    end

    def character=(character)
    	if self.class.find_character_by_name(character) != nil
    		@character = self.class.find_character_by_name(character)
    	else	
    		@character = Character.new(character)
    	end
    	@character.add_quote(self)
 	end

	def self.all
		@@all
	end

	def self.list_all_quotes
		@@all.each do |quote|
			puts quote.content
		end	
	end

	def self.find_character_by_name(name)
		character = nil
		self.all.each do |quote|
			if quote.character != nil
				if quote.character.name == name
					character = quote.character
				end
			end
		end
		character
	end

	def self.get_dialogue
		n = @@dialogue_quotes.size - 1
		r = rand(0..n)
		puts "#{@@dialogue_quotes[r].content}"
	end

	def self.get_random
		n = @@all.size - 1
		r = rand(0..n)
		if @@all[r].character != nil
			puts "#{@@all[r].content} -#{@@all[r].character.name}"
		else
			puts "#{@@all[r].content}"
		end
	end

end