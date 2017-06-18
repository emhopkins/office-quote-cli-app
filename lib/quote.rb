require 'open-uri'
require 'nokogiri'
require 'pry'

class Quote
	attr_accessor :character, :content

	@@all = []

	def initialize(content, character="")
		@content = content
		if character != ""
      		self.character=(character)
    	end
    	@@all << self
    	# binding.pry
    end

    def character=(character)
    	if self.class.find_character_by_name(character) != nil
    		@character = self.class.find_character_by_name(character)
    	else	
    		@character = Character.new(character)
    	end
    	# binding.pry
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
		# self.all.detect{ |a| a.character.name == name }
		self.all.each do |quote|
			if quote.character != nil
				if quote.character.name == name
					character = quote.character
				end
			end
		end
		character
	end

	# def scrape_office_quotes(page)
	# 	# will scrape website for quotes and character names
	# 	# each quote will create a quote object
	# 	quote_object = {}
	# 	index_page = Nokogiri::HTML(open(page))
	# 	line_string = ""
	# 	index_page.css("div.quotes blockquote").each do |quote|
	# 		# binding.pry
	# 		# full_quote = ""
	# 		character = quote.css("small").text
	# 		quote.css("p").each do |line|
	# 			# Using .text will not push items with breaks right next to each other
	# 			# Using .to_s on the nokogiri element allow me to identify <br>'s create space between each line within the <p> element
	# 			line_string = line.to_s
	# 			line_string.gsub!("<br>", " ") 
	# 			line_string.gsub!("<p>", "") 
	# 			line_string.gsub!("</p>", "") 
	# 			line_string = line_string.strip
	# 		end	
	# 		# quote_object[quote.text.to_sym] = {
	# 		# 	:quote => line_string.strip,
	# 		# 	:character => character.strip
	# 		# }.reject{ |k,v| v == "" }
	# 		# @@quotes << quote_object[quote.text.to_sym]
	# 		Quote.new(line_string, character)
	# 	end
	# end

	# def get_quote_pages
	# 	scrape_office_quotes("https://www.tvfanatic.com/quotes/shows/the-office/")
	# 	# 217.times do |i|
	# 	10.times do |i|
	# 		page = "https://www.tvfanatic.com/quotes/shows/the-office/page-" + "#{i}" + ".html"
	# 		scrape_office_quotes(page)
	# 	end
	# 	binding.pry
	# end

	# initialize will create quote objects with an optional character, content is required

	#find all quotes for a given character

	#list all quotes

end