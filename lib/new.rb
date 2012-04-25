dir = File.dirname(__FILE__)
$LOAD_PATH << dir unless $LOAD_PATH.include?(dir)

require 'iso_country_codes'

country_code_enter =("2") #example
country_code_enter= country_code_enter.gsub("+", '')

code = IsoCountryCodes.find_country(country_code_enter)
puts country_code_enter
if !code.respond_to?('exception')
  p code.name
else
  p code.message
end


