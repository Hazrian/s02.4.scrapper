require 'pry' # frozen_string_literal: true
require 'nokogiri'
require 'open-uri'

def get_townhall_urls(url= "https://annuaire-des-mairies.com/val-d-oise.html")
  city_url_array = Array[]
  city_name_array = Array[]
  page_html = Nokogiri::HTML(open(url))	# open html page
  city_url = page_html.search('.lientxt').each do |city| # Search by class "lientxt"
    city_name_array << city.text # take city name in the array
    city_url_array << city['href'][1..-1]
  end
  return city_name_array.zip(city_url_array).to_h
end

def get_townhall_email(townhall_url)
  a = Nokogiri::HTML(open(townhall_url)).xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  return a
end

def get_townhall_email_array
  j = 0
  final_mails_townhall = {}
  get_townhall_urls.each do |key, value|
    puts final_mails_townhall[key] = get_townhall_email("https://annuaire-des-mairies.com#{value}")
    puts j += 1
  end

  puts final_mails_townhall
  puts final_mails_townhall.class
  return final_mails_townhall
end

# get_townhall_email_array
