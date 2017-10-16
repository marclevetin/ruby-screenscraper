require 'nokogiri'
require 'httparty'
require 'pry'

# fetches page data and parses it
page = HTTParty.get('https://www.theukulelesite.com/')
parsed_page = Nokogiri::HTML(page)
all_products = parsed_page.css('.product-name')

# this loop creates the final product list

final_ukuleles = []

all_products.each do |ukulele|
  workin_ukulele = {}
  workin_ukulele[:name] = ukulele.children[0].children[0].text
  workin_ukulele[:url] = ukulele.children[0].attributes["href"].value
  final_ukuleles.push(workin_ukulele)
end

binding.pry
