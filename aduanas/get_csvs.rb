require 'httparty'

def get_content(url)
  response = HTTParty.get(url)
  response.body
end

def arabia_csv(year, taric)
  url = "http://aduanas.camaras.org/downieespannola.php?impexp=E&anno=#{year}&mes=00&tipo=ORGDES&meses=%2200%22&producto=TA&codprod=#{taric}&result=DOWN_PS&orden=LOCAL&areanacional=PR&codareanac=&areainternac=PS&codareainter=632&login=&pass="
  get_content(url)
end

def store(filename, content)
  File.open(filename, 'w') { |file| file.write(content) }
end

def store_arabia_csv(year, taric)
  content = arabia_csv(year, taric)
  store("aduanas/#{year}-#{taric}.csv", content)
end

(10..17).to_a.each do |year|
  store_arabia_csv(year, 93)
  store_arabia_csv(year, 8906)
end