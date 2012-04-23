#!/usr/bin/env ruby

require 'rubygems'
require '/Users/awassif1/o2_projects/iso_country_codes/lib/iso_country_codes'



code = IsoCountryCodes.find("44")



# country_code_prefix = code.numeric
puts code.numeric
#country_code_prefix= country_code_prefix.gsub("+", 'replaced')   
# puts country_code_prefix
 puts code.name


