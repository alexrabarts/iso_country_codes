require 'i18n'

dir = File.dirname(__FILE__)
$LOAD_PATH << dir unless $LOAD_PATH.include?(dir)

I18n.load_path += Dir.glob File.join dir, '../config/locales/*.{rb,yml}'
I18n.backend.load_translations

require 'iso_country_codes/code'
require 'iso_country_codes/iso_3166_1'
require 'iso_country_codes/iso_13616_1'
require 'iso_country_codes/iso_4217'
require 'iso_country_codes/calling'
require 'iso_country_codes/continent'
require 'iso_country_codes/iso_country_codes'
