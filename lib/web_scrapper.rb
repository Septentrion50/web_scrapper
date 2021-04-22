require 'nokogiri'
require 'open-uri'

def crypto_scrapper 
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  table = page.css("tbody/tr")
    out = []
    table.each do |element|
      name = element.xpath("td[2]/div/a").text
      price = element.xpath("td[5]/div/a").text
      out << Hash[name=>price]
    end
    return out
end

puts crypto_scrapper
