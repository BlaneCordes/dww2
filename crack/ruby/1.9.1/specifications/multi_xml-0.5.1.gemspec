# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{multi_xml}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Erik Michaels-Ober"]
  s.date = %q{2012-05-10}
  s.description = %q{A gem to provide swappable XML backends utilizing LibXML, Nokogiri, Ox, or REXML.}
  s.email = %q{sferik@gmail.com}
  s.files = [".gemtest", ".gitignore", ".rspec", ".travis.yml", ".yardopts", "Gemfile", "LICENSE.md", "README.md", "Rakefile", "lib/multi_xml.rb", "lib/multi_xml/parsers/libxml.rb", "lib/multi_xml/parsers/libxml2_parser.rb", "lib/multi_xml/parsers/nokogiri.rb", "lib/multi_xml/parsers/ox.rb", "lib/multi_xml/parsers/rexml.rb", "lib/multi_xml/version.rb", "multi_xml.gemspec", "spec/helper.rb", "spec/multi_xml_spec.rb", "spec/parser_shared_example.rb", "spec/speed.rb"]
  s.homepage = %q{https://github.com/sferik/multi_xml}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A generic swappable back-end for XML parsing}
  s.test_files = ["spec/helper.rb", "spec/multi_xml_spec.rb", "spec/parser_shared_example.rb", "spec/speed.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<maruku>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<maruku>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<maruku>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
