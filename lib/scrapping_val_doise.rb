require 'pry'
require 'nokogiri'
require 'open-uri'

url = "https://annuaire-des-mairies.com/val-d-oise.html"    					#URL mairies list

def get_townhall_urls(url= "https://annuaire-des-mairies.com/val-d-oise.html")
  city_url = " "                                           						#initialization varialble
  i = 0
  city_url_array = Array[]
  city_name_array = Array[]
  page_html = Nokogiri::HTML(open(url))                    						#open html page
  city_url = page_html.search(".lientxt").each do |city_url|           			#Search by class "lientxt"
    city_name_array << city_url.text                     						#take city name in the array
    city_url_array << city_url["href"][1..-1]
  end                                                     						#take end of city's url
  return city_name_array.zip(city_url_array).to_h
end

def get_townhall_email(townhall_url)
  a = Nokogiri::HTML(open(townhall_url)).xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  return a
end

def get_townhall_email_array
  puts final_mails_townhall = get_townhall_urls.map{ |key, value| get_townhall_urls[key] = get_townhall_email("https://annuaire-des-mairies.com#{value}")}
  puts final_mails_townhall.class
  return final_mails_townhall
end

get_townhall_email_array
