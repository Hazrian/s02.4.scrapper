require 'pry' # frozen_string_literal: true
require 'nokogiri'
require 'open-uri'

def scrapping_crypto(url)
  page = Nokogiri::HTML(open(url))
  price = Array[]
  symbol = Array[]
  i = 'empty'
  j = 0
  while i != ''

    i = page.xpath("//tbody/tr[#{j + 1}]/td[5]/a").text
    price << i
    symbol << page.xpath("//tbody/tr[#{j + 1}]/td[3]").text
    puts j += 1
  end
  puts hash = symbol.zip(price).to_h
  puts "#{symbol.length} nombre de monnaie"
  return hash
end
# scrapping_crypto("https://coinmarketcap.com/all/views/all/")
