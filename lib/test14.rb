require "rubygems"
require "nokogiri"
require "open-uri"

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
puts page.class   # => Nokogiri::HTML::Document
