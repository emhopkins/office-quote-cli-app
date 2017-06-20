
require_relative './lib/the_office_quote_generator/version'

Gem::Specification.new do |s|
  s.name        = 'the-office-quote-generator'
  s.version     = TheOfficeQuoteGenerator::VERSION
  s.date        = '2017-06-18'
  s.summary     = "Quotes from the TV series, \"The Office\" "
  s.description = "Allows a user to generate quotes from \"The Office\""
  s.authors     = ["Elena Hopkins"]
  s.email       = 'elenamariehopkins@gmail.com'
  s.license     = 'MIT'
  s.files       = ["lib/the_office_quote_generator.rb", "lib/office_quote_controller.rb", "lib/quote.rb", "lib/character.rb", "lib/scraper.rb", "bin/the-office-quote-generator"]
  s.require_paths = ["lib"]
  s.executables << 'the-office-quote-generator'
  s.homepage    = 'https://rubygems.org/gems/the-office-quote-generator'

  s.add_runtime_dependency "bundler", "~> 1.10"
  s.add_runtime_dependency 'nokogiri'
  s.add_runtime_dependency 'pry', '~> 0'
end