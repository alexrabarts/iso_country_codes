dir = File.dirname(__FILE__)
$LOAD_PATH << dir unless $LOAD_PATH.include?(dir)

require 'iso_country_codes'

country_code_enter =("231") #example
country_code_enter= country_code_enter.gsub("+", '')

code = IsoCountryCodes.find(country_code_enter)

if !code.respond_to?('exception')
  p code.numeric + "  ISO 3166-1 code"
  p code.c_code + "   country code"
  p code.name  + "    country name"
else
  p code.message
end




