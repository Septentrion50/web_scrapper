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
    end
  end
  return  out.delete_if {|x| x == {""=>""}}
end

def chers_deputes
  page_general = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/tableau'))
  table = page_general.css('tbody/tr')
  out = []
  table.each do |element|
    url = element.css('td/a')[0]['href']
    page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr#{url}"))
    depute = Hash.new
    arr_names = page.css('div[class="titre-bandeau-bleu clearfix"]/h1').text.split
    if arr_names.size == 3
      f_name = arr_names[1]
      l_name = arr_names[2]
    elsif arr_names.size > 3
      f_name = arr_names[1]
      l_name = arr_names[2..-1].join(" ")
    end
    depute["first_name"] = f_name
    depute["last_name"] = l_name
    begin
      mail = page.css('dl[class="deputes-liste-attributs"]').css('dd')[3].css('ul')[0].css('li')[1].css('a').text
    rescue NoMethodError
      begin
        mail = page.css('dl[class="deputes-liste-attributs"]').css('dd')[2].css('ul')[0].css('li')[1].css('a').text
      rescue NoMethodError
        mail = "Pas de mail"
      end
    end
    depute["email"] = mail
    out << depute
  end
  return out
end

def perform
  puts crypto_scrapper
  puts mairie_christmas
  puts chers_deputes
end

perform
