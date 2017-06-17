require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

	@@quotes = []

	def scrape_office_quotes(page)
		# will scrape website for quotes and character names
		# each quote will create a quote object
		quote_object = {}
		index_page = Nokogiri::HTML(open(page))
		line_string = ""
		index_page.css("div.quotes blockquote").each do |quote|
			# binding.pry
			# full_quote = ""
			character = quote.css("small").text
			quote.css("p").each do |line|
				# Using .text will not push items with breaks right next to each other
				# Using .to_s on the nokogiri element allow me to identify <br>'s create space between each line within the <p> element
				line_string = line.to_s
				line_string.gsub!("<br>", " ") 
				line_string.gsub!("<p>", "") 
				line_string.gsub!("</p>", "") 
			end	
			quote_object[quote.text.to_sym] = {
				:quote => line_string.strip,
				:character => character.strip
			}.reject{ |k,v| v == "" }
			@@quotes << quote_object[quote.text.to_sym]
		end
	end

	def get_quote_pages
		scrape_office_quotes("https://www.tvfanatic.com/quotes/shows/the-office/")
		# 217.times do |i|
		10.times do |i|
			page = "https://www.tvfanatic.com/quotes/shows/the-office/page-" + "#{i}" + ".html"
			scrape_office_quotes(page)
		end
		binding.pry
	end

end

quote = Scraper.new
quote.get_quote_pages