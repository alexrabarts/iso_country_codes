# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{iso_country_codes}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["alex"]
  s.date = %q{2009-08-07}
  s.description = %q{ISO country code and currency library}
  s.email = %q{alexrabarts@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "Manifest.txt",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "iso_country_codes.gemspec",
     "lib/iso_country_codes.rb",
     "lib/iso_country_codes/code.rb",
     "lib/iso_country_codes/iso_3166_1.rb",
     "lib/iso_country_codes/iso_4217.rb",
     "lib/iso_country_codes/iso_country_codes.rb",
     "rakelib/cultivate.rake",
     "rakelib/iso_3166_1.rake",
     "rakelib/iso_3166_1.rb",
     "rakelib/iso_3166_1.rb.erb",
     "test/iso_country_codes_test.rb"
  ]
  s.homepage = %q{http://github.com/alexrabarts/iso_country_codes}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Provides ISO 3166-1 country codes/names and ISO 4217 currencies.}
  s.test_files = [
    "test/iso_country_codes_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
