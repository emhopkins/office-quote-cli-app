require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

	def scrape_office_quotes(page)
		index_page = Nokogiri::HTML(open(page))
		line_string = ""
		index_page.css("div.quotes blockquote").each do |quote|
			character = quote.css("small").text.strip
			if character.length > 40
				character = ""
			end
			quote.css("p").each do |line|
				# Using .text will not push items with breaks right next to each other
				# Using .to_s on the nokogiri element allow me to identify <br>'s create space between each line within the <p> element
				line_string = line.to_s
				line_string.gsub!("<br>", " ") 
				line_string.gsub!("<p>", "") 
				line_string.gsub!("</p>", "") 
				line_string = line_string.strip
			end	
			Quote.new(line_string, character)
		end
	end

	def get_quote_pages
		216.times do |i|
		# 10.times do |i|
			page = "https://www.tvfanatic.com/quotes/shows/the-office/page-" + "#{i + 1}" + ".html"
			scrape_office_quotes(page)
		end
	end

end
