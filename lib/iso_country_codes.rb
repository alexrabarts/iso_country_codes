dir = File.dirname(__FILE__)
$LOAD_PATH << dir unless $LOAD_PATH.include?(dir)

require 'iso_country_codes/code'
require 'iso_country_codes/iso_3166_1'
require 'iso_country_codes/iso_country_codes'
