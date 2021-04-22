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

def mairie_christmas
  page_general = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/"))
  links = page_general.css('pre/a')
  out = []
  links.each do |element|
    begin
      page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/#{element.text}"))
      name = page.css('main//h1').text
      table = page.css('table.table:nth-child(1)')
      mail = table.css('tbody/tr[4]/td[2]').text
      out << Hash[name[0..-9].downcase=>mail] 
    rescue OpenURI::HTTPError, URI::InvalidURIError
      puts "Not a valid link"
    end
  end
  return  out.delete_if {|x| x == {""=>""}}
end

