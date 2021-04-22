require 'nokogiri'
require 'open-uri'


def scraping 
    url = "https://coinmarketcap.com/all/views/all/"
    page = Nokogiri::HTML(open(url))

    
    //*[@id="__next"]/div/div[1]/div[2]/div/div/div[2]/table/tbody/tr[1]/td[3]/div/a/div/div/p
    nom = []
    vameur = [] 



    combo.each do |crypto|
        puts 
    end


end



perform
    adresse
end