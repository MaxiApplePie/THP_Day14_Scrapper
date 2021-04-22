require "nokogiri"
require "open-uri"

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

# <a class='lientxt' href='./95/ableiges.html'>ABLEIGES</a><br>
# <a class='lientxt' href='./95/aincourt.html'>AINCOURT</a><br>

arrMairie = Array.new
mairies_names = doc.xpath("//td[1]/p/a/@href | //td[1]/p/a/text()").each do # OKkkkkkkkkkkkkkkkkkkkkk "./95/amenucourt.html"
#mairies_names = doc.xpath("//td/p/a/text()").each do # OKkkkkkkkkkkkkkkkkkkkkk .. Toutes les villes
  |mairie, toto| puts toto.text end
#  |mairie_ref mairie_url| arrMairie.push(mairie_ref, mairie_url ) end
puts arrMairie[2]

# OK _____  mairies_names = doc.xpath("//td[1]/p/a").each do
# OK _____    |mairie| mairie.text end
# OK _____  puts mairies_names

# EACH ****
# =========>   <a class="lientxt" href="./95/cormeilles-en-vexin.html">CORMEILLES EN VEXIN</a>
# =========>   <a class="lientxt" href="./95/courcelles-sur-viosne.html">COURCELLES SUR VIOSNE</a>
# =========>   <a class="lientxt" href="./95/courdimanche.html">COURDIMANCHE</a>
