class Quote
	attr_accessor :characer, :content

	@@all = []

	def initialize(content, character="")
		@content = content
		if character != ""
      		self.character=(character)
    	end
    end

    def character=(character)
    	@character = character
    	@character.add_quote(self)
 	end

	def self.all
		@@all
	end

	# initialize will create quote objects with an optional character, content is required

	#find all quotes for a given character

	#list all quotes

end