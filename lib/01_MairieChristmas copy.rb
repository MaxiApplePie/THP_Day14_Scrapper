require "nokogiri"
require "open-uri"

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

# <a class='lientxt' href='./95/ableiges.html'>ABLEIGES</a><br>
# <a class='lientxt' href='./95/aincourt.html'>AINCOURT</a><br>
# <a class='lientxt' href='./95/ambleville.html'>AMBLEVILLE</a><br>
# <a class='lientxt' href='./95/amenucourt.html'>AMENUCOURT</a><br>

# OK _____  mairies_names = doc.xpath("//td[1]/p/a | //td[2]/p/a").map do
# OK _____    |mairie| mairie.text end
# OK _____  puts mairies_names

arrMairie = Array.new
# mairies_names = doc.xpath("//td[1]/p/a/@href").each do  # OKkkkkkkkkkkkkkkkkkkkkk
# mairies_names = doc.xpath("//td/p/a/text()").each do # OKkkkkkkkkkkkkkkkkkkkkk .. Toutes les villes
#   |mairie| arrMairie.push(mairie.text) end
# puts arrMairie.join(" ")

def get_townhall_email(townhall_url)
  # XPATH : /html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]
  doc_email = Nokogiri::HTML(URI.open(townhall_url))
  return mairie_email = doc_email.xpath("//section[2]/div/table/tbody/tr[4]/td[2]/text()")
end

puts get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")

# OK _____  mairies_names = doc.xpath("//td[1]/p/a").each do
# OK _____    |mairie| mairie.text end
# OK _____  puts mairies_names
# EACH ****
# =========>   <a class="lientxt" href="./95/cormeilles-en-vexin.html">CORMEILLES EN VEXIN</a>
# =========>   <a class="lientxt" href="./95/courcelles-sur-viosne.html">COURCELLES SUR VIOSNE</a>
# =========>   <a class="lientxt" href="./95/courdimanche.html">COURDIMANCHE</a>

# 1_ Sortir les liens sur les villes du 95
# =>  <a class='lientxt' href='./95/aincourt.html'>AINCOURT</a><br>
# => //*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[2]
# => //*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[3]
# 2_ Aller sur un lien specifique pour recuperer le mail

# //*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]

# doc.xpath("//*[@id=\"__next\"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]").each do |info|
#   arrayCode.push(info.content)
# end
