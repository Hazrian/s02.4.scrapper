require 'pry'
require 'nokogiri'
require 'open-uri'



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
  a = Nokogiri::HTML(open(depute_url)).xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a").text
  return a
end

def get_depute_email_array

j=0
  mails_depute = {}
  get_depute_urls.each do |key, value|
	puts mails_depute[key] = get_depute_email(value)
	puts j+=1
  end


  # puts get_depute_urls.each do |key, value| 
	# get_depute_urls[key] = get_depute_email(value)
  # end
  
  
  
  final_array = Array[]
  mails_depute.each do |depute_name,depute_mail|
    hash = {}
    hash[:first_name] = depute_name.split(" ")[0]
    hash[:last_name] = depute_name.split(" ")[1..-1].join(" ")
    hash[:email] = depute_mail
      final_array << hash
  end
  puts final_array
  return final_array
end


# get_depute_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036")

# get_depute_urls

#get_depute_email_array
