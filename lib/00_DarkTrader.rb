require "nokogiri"
require "open-uri"

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

# Search for nodes by xpath
# doc.xpath("//nav//ul//li/a", "//article//h2").each do |link|
#   puts link.content
# end

###### doc.xpath("//*[@id=\"__next\"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td").each do |info|
######   puts info.content
###### end   GOOOOOOOOOOOOOOOOOD !!!!!!!!!!

arrayCode = Array.new
arrayPrice = Array.new
hashCoin = Hash.new
a = Array.new

doc.xpath("//*[@id=\"__next\"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]").each do |info|
  arrayCode.push(info.content)
end
doc.xpath("//*[@id=\"__next\"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]").each do |info|
  arrayPrice.push(info.content)
end

arrayCode.each_with_index do |value, key|
  #  puts "la key #{key} et la valeur #{value}"
  hashCoin.store(value, arrayPrice[key].tr("$", "").tr(",", "").to_f)
end

a = hashCoin
puts hashCoin
# //*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[3]/td[3]

# a = [
#   { "BTC" => 5245.12 },
#   { "ETH" => 217.34 },
#   etc
# ]

#################### XPATH
# tarif
# // * [@id = "__next"] / div[1] / div[2] / div / div[1] / div / div[2] / div[3] / div / table / tbody / tr[5] / td[5]
# Code
# // * [@id = "__next"] / div[1] / div[2] / div / div[1] / div / div[2] / div[3] / div / table / tbody / tr[5] / td[3]

# code

##
# <tr class="cmc-table-row" style="display:table-row">
# <td
#  class="cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__rank">
#  <div class="">2</div>
# </td>
# <td
#  class="cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__name">
#  <div class="sc-1kxikfi-0 fjclfm cmc-table__column-name"><img
#      src="https://s2.coinmarketcap.com/static/img/coins/32x32/1027.png" alt="Ethereum"
#      width="16" height="16" class="cmc-static-icon cmc-static-icon-1027" /><a
#      href="/currencies/ethereum/" title="Ethereum" class="cmc-link">Ethereum</a></div>
# </td>
# <td
#  class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol">
#  <div class="">ETH</div>
# </td>
# <td
#  class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__market-cap">
#  <p style="white-space:nowrap" color="text" font-size="1" class="sc-1eb5slv-0 kDEzev">
#    $280,873,039,899</p>
# </td>
# <td
#  class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price">
#  <div class="price___3rj7O "><a href="/currencies/ethereum/markets/"
#      class="cmc-link">$2,430.50</a></div>
# </td>
# <td
#  class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__circulating-supply">
#  <div class="">115,561,779
#    <!-- --> ETH
#  </div>
# </td>
# <td
#  class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__volume-24-h">
#  <a href="/currencies/ethereum/markets/" class="cmc-link">$40,577,157,715</a></td>
# <td
#  class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__percent-change-1-h">
#  <div class="cmc--change-negative">-0.64
#    <!-- -->%
#  </div>
# </td>
# <td
#  class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__percent-change-24-h">
#  <div class="cmc--change-positive">10.81
#    <!-- -->%
#  </div>
# </td>
# <td
#  class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__percent-change-7-d">
#  <div class="cmc--change-positive">2.98
#    <!-- -->%
#  </div>
# </td>
# <td class="cmc-table__cell cmc-table__cell--right">
#  <div class="kdqqbs-0 caWjjK">
#    <div class="sc-12d77vg-0 iUcCUc cmc-popover">
#      <div class="cmc-popover__trigger"><svg xmlns="http://www.w3.org/2000/svg"
#          fill="currentColor" height="16px" width="16px" viewBox="0 0 24 24"
#          class="sc-16r8icm-0 kyoBCp">
#          <path
#            d="M12 14C13.1046 14 14 13.1046 14 12C14 10.8954 13.1046 10 12 10C10.8954 10 10 10.8954 10 12C10 13.1046 10.8954 14 12 14Z">
#          </path>
#          <path
#            d="M5 14C6.10457 14 7 13.1046 7 12C7 10.8954 6.10457 10 5 10C3.89543 10 3 10.8954 3 12C3 13.1046 3.89543 14 5 14Z">
#          </path>
#          <path
#            d="M19 14C20.1046 14 21 13.1046 21 12C21 10.8954 20.1046 10 19 10C17.8954 10 17 10.8954 17 12C17 13.1046 17.8954 14 19 14Z">
#          </path>
#        </svg></div>
#    </div>
#  </div>
# </td>
# </tr>

{ "BTC" => 54815.19, "ETH" => 2493.29, "BNB" => 567.8, "XRP" => 1.34, "USDT" => 0.9999, "ADA" => 1.23, "DOGE" => 0.2884, "DOT" => 35.13, "UNI" => 37.11, "LTC" => 268.17, "BCH" => 935.96, "LINK" => 37.48, "VET" => 0.2291, "XLM" => 0.4935, "USDC" => 0.9999, "THETA" => 11.23, "FIL" => 149.64, "SOL" => 36.87, "TRX" => 0.1242, "WBTC" => 54866.47, "XMR" => 387.39, "NEO" => 98.09, "EOS" => 6.48, "MIOTA" => 2.14, "KLAY" => 2.39, "BSV" => 303.89, "BUSD" => 1.0, "LUNA" => 13.84, "BTT" => 0.007588, "FTT" => 52.32, "MKR" => 4809.08, "CRO" => 0.1894, "AAVE" => 383.65, "CAKE" => 27.8, "ATOM" => 20.25, "XTZ" => 5.41, "ETC" => 35.27, "ALGO" => 1.3, "HT" => 20.73, "DAI" => 1.0, "AVAX" => 26.48, "XEM" => 0.3587, "EGLD" => 183.97, "RUNE" => 13.66, "DASH" => 304.9, "KSM" => 359.02, "BTCB" => 55252.78, "CHZ" => 0.522, "ZEC" => 244.45, "COMP" => 547.47, "DCR" => 210.06, "HOT" => 0.01533, "STX" => 2.28, "HBAR" => 0.2996, "DGB" => 0.1669, "LEO" => 2.19, "MANA" => 1.36, "ENJ" => 2.55, "NEXO" => 3.73, "MATIC" => 0.3973, "ZIL" => 0.1796, "SC" => 0.04239, "GRT" => 1.54, "SNX" => 16.4, "BAT" => 1.25, "UST" => 0.9994, "NEAR" => 4.95, "YFI" => 47487.63, "SUSHI" => 13.12, "UMA" => 26.33, "QTUM" => 15.92, "ONT" => 1.92, "TFUEL" => 0.2892, "RVN" => 0.1775, "CEL" => 6.38, "WAVES" => 14.37, "BTG" => 86.11, "RSR" => 0.0982, "ICX" => 2.17, "ZRX" => 1.65, "ZEN" => 114.58, "BNT" => 6.8, "NANO" => 8.83, "CHSB" => 1.16, "CELO" => 5.59, "FLOW" => 33.53, "ONE" => 0.1177, "REV" => 0.01293, "OMG" => 7.77, "OKB" => 17.84, "KCS" => 13.41, "IOST" => 0.06363, "ANKR" => 0.1485, "HNT" => 12.8, "XVG" => 0.06277, "FTM" => 0.3861, "BTMX" => 1.23, "PAX" => 0.9995, "REN" => 0.8621, "CFX" => 0.9948, "DENT" => 0.008671, "CRV" => 2.96, "1INCH" => 5.15, "WRX" => 3.06, "XVS" => 80.82, "VGX" => 3.35, "AR" => 22.03, "BTCST" => 68.89, "HUSD" => 0.9999, "VTHO" => 0.02006, "RENBTC" => 54857.21, "MCO" => 43.34, "LRC" => 0.5571, "LSK" => 5.2, "LPT" => 30.34, "SNT" => 0.1833, "KNC" => 3.0, "OGN" => 2.19, "MDX" => 3.18, "OCEAN" => 1.31, "CKB" => 0.0221, "STORJ" => 1.85, "ZKS" => 2.62, "MAID" => 1.1, "QNT" => 41.08, "EWT" => 15.76, "GLM" => 0.4487, "BCD" => 2.28, "STMX" => 0.04923, "NKN" => 0.7009, "REP" => 36.9, "IOTX" => 0.04191, "BAL" => 58.11, "DODO" => 3.64, "ANT" => 9.83, "ALPHA" => 1.53, "ARDR" => 0.3801, "REEF" => 0.03351, "TEL" => 0.007297, "WIN" => 0.001204, "FET" => 0.491, "SKL" => 0.5523, "CVC" => 0.5385, "NMR" => 72.46, "FUN" => 0.03428, "SAND" => 0.5114, "ORBS" => 0.155, "BAND" => 16.8, "BTS" => 0.1146, "STEEM" => 0.9206, "MED" => 0.1249, "KMD" => 2.69, "SXP" => 3.87, "KIN" => 0.0002168, "BTM" => 0.2297, "VLX" => 0.1497, "TUSD" => 0.9997, "SWAP" => 3.96, "SRM" => 6.43, "WAXP" => 0.2019, "UBT" => 2.09, "INJ" => 19.42, "AGI" => 0.3486, "NOIA" => 0.8027, "CELR" => 0.05388, "JST" => 0.1293, "KAVA" => 4.99, "RDD" => 0.01046, "AMPL" => 1.35, "WAN" => 1.68, "BADGER" => 33.02, "PPT" => 5.2, "GNO" => 183.16, "MTL" => 4.21, "WOO" => 0.7233, "XHV" => 18.67, "ONG" => 1.02, "GT" => 3.43, "STRAX" => 1.96, "CVT" => 0.2401, "UQC" => 25.17, "AVA" => 5.0, "ARK" => 1.93, "IQ" => 0.02398, "OXT" => 0.6419, "HIVE" => 0.5914, "ROSE" => 0.1557, "ELF" => 0.428, "META" => 0.187, "POLY" => 0.3819, "TRAC" => 0.6444, "UTK" => 0.5089, "SCRT" => 3.31, "SYS" => 0.3698, "RIF" => 0.3046, "VAI" => 0.917, "COTI" => 0.3228, "QKC" => 0.0324, "RLC" => 2.58, "ZB" => 0.4446 }
