require 'pry'
require 'nokogiri'
require 'open-uri'


# page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
# puts  page.search("td a")[0]["href"]
# /html/body/div[3]/div/div/section/div/article/div[3]/div/div/table/tbody/tr[1]/td[1]/a
# /html/body/div[3]/div/div/section/div/article/div[3]/div/div/table/tbody/tr[7]/td[1]/a



def get_depute_urls(url= "http://www2.assemblee-nationale.fr/deputes/liste/tableau")
  depute_url_array = Array[]
  depute_name_array = Array[]
  page = Nokogiri::HTML(open(url))                     #open html page
  page.search("td a").each do |depute|

    depute_name_array << depute.text.split(" ")[1..-1].join(" ")
    depute_url_array << "http://www2.assemblee-nationale.fr#{depute["href"]}"
  end
  return depute_name_array.zip(depute_url_array).to_h
end

def get_depute_email(depute_url)
  puts a = Nokogiri::HTML(open(depute_url)).xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a").text
  return a
end

def get_depute_email_array
  puts get_depute_urls.map{ |key, value| get_depute_urls[key] = get_depute_email(value)}
  final_array = Array[]
  get_depute_urls.each do |depute_name,depute_mail|
    hash = {}
    hash[:first_name] = depute_name.split(" ")[0]
    hash[:last_name] = depute_name.split(" ")[1..-1].join(" ")
    hash[:email] = depute_mail
      final_array << hash
  end
  return final_array
end


# get_depute_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036")

# get_depute_urls

get_depute_email_array
