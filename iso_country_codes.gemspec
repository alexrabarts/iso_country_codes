Gem::Specification.new do |s|
  s.name = %q{iso_country_codes}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Rabarts"]
  s.date = %q{2008-11-24}
  s.description = %q{Provides ISO codes and names for countries.}
  s.email = ["alexrabarts@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "iso_country_codes.gemspec", "lib/iso_country_codes.rb", "lib/iso_country_codes/code.rb", "lib/iso_country_codes/iso_3166_1.rb", "lib/iso_country_codes/iso_country_codes.rb", "rakelib/cultivate.rake", "rakelib/iso_3116_1.rake", "rakelib/iso_3166_1.rb", "rakelib/iso_3166_1.rb.erb", "test/test_iso_country_codes.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{iso_country_codes}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Provides ISO codes and names for countries.}
  s.test_files = ["test/test_iso_country_codes.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end
