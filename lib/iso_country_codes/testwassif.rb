#!/usr/bin/env ruby

require 'rubygems'
require '/Users/awassif1/o2_projects/iso_country_codes/lib/iso_country_codes'



code = IsoCountryCodes.find("590")



 country_code_prefix = code.c_code
#country_code_prefix= country_code_prefix.gsub("+", 'replaced')   
# puts country_code_prefix
 puts code.name
 puts country_code_prefix


