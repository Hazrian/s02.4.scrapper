require 'pry'
require 'nokogiri'
require 'open-uri'



def scrapping_crypto(url)
  page = Nokogiri::HTML(open(url))
  price = Array[]
  symbol = Array[]
  i = "empty"
  j = 0
  while i != ""

   i = page.xpath("//tbody/tr[#{j+1}]/td[5]/a").text
   price << i
   symbol << page.xpath("//tbody/tr[#{j+1}]/td[3]").text
   puts j += 1
  end
  puts hash = symbol.zip(price).to_h
  puts "#{symbol.length} nombre de monnaie"
  puts "#{symbol.uniq.length} nombre de monnaie unique"
  puts "#{price.length} nombre de prix"
  puts "#{hash.length} nombre d'association prix monnaie"
  return hash
end
#scrapping_crypto("https://coinmarketcap.com/all/views/all/")


# puts page.xpath("//tbody/tr[1]/td[5]/a").text.class
######## début du programme #########
