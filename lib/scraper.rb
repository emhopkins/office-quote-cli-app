require 'open-uri'
require 'nokogiri'
require 'pry'

def scrape_office_quotes
	# will scrape website for quotes and character names
	# each quote will create a quote object
	quotes = []
	quote_object = {}
	index_page = Nokogiri::HTML(open("https://www.tvfanatic.com/quotes/shows/the-office/"))
	# binding.pry
	index_page.css("div.quotes blockquote").each do |quote|
		binding.pry
		character = quote.css("small").text
		quote_object[quote.text.to_sym] = {
			:quote => quote.css("p").text,
			:character => character
		}.reject{ |k,v| v == "" }
		quotes << quote_object[quote.text.to_sym]
	end
	binding.pry
end

scrape_office_quotes