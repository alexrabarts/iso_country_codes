require 'iso_country_codes'

country_code_enter =("+44") #example
country_code_enter= country_code_enter.gsub("+", '')

code = IsoCountryCodes.find_country(country_code_enter)
puts country_code_enter
puts code.name
