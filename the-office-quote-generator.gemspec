
require_relative './lib/the_office_quote_generator/version'

Gem::Specification.new do |s|
  s.name        = 'worlds-best-restaurants'
  s.version     = TheOfficeQuoteGenerator::VERSION
  s.date        = '2017-06-18'
  s.summary     = "Quotes from the TV series, \"The Office\" "
  s.description = "Allows a user to generate quotes from \"The Office\""
  s.authors     = ["Elena Hopkins"]
  s.email       = 'elenamariehopkins@gmail.com'
  s.license     = 'MIT'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end