require 'iso_country_codes'

country_code_enter =("+442") #example
country_code_enter= country_code_enter.gsub("+", '')
country_code_enter = country_code_enter + ("c_code")

country_code_enter[2..8]
country_code_enter[3..8]

code = IsoCountryCodes.find(country_code_enter)
puts country_code_enter
puts code.name
