#!/usr/bin/env ruby

require 'rubygems'
require '/Users/awassif1/o2_projects/iso_country_codes/lib/iso_country_codes.rb'

country_code_enter =("36") #example
code = IsoCountryCodes.find(country_code_enter)
puts country_code_enter
puts code.name