# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ap}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Coomans"]
  s.date = %q{2011-05-10}
  s.description = %q{Ruby gem for interfacing with the Associated Press Breaking News API}
  s.email = %q{alex@alexcoomans.com}
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = [".document", "Gemfile", "LICENSE.txt", "README.rdoc", "Rakefile", "VERSION", "ap.gemspec", "lib/ap.rb", "lib/ap/api.rb", "lib/ap/article.rb", "lib/ap/category.rb", "lib/ap/client.rb", "lib/ap/client/category.rb", "lib/ap/configuration.rb", "lib/ap/parser.rb", "lib/ap/search.rb", "lib/ap/version.rb", "spec/ap/api_spec.rb", "spec/ap/article_spec.rb", "spec/ap/category_spec.rb", "spec/ap/client/category_spec.rb", "spec/ap/client_spec.rb", "spec/ap/parser_spec.rb", "spec/ap/search_spec.rb", "spec/ap_spec.rb", "spec/fixtures/categories-31990.xml", "spec/fixtures/categories.xml", "spec/fixtures/search-obama.xml", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/drcapulet/ap}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby Associated Press API Gem}
  s.test_files = ["spec/ap/api_spec.rb", "spec/ap/article_spec.rb", "spec/ap/category_spec.rb", "spec/ap/client/category_spec.rb", "spec/ap/client_spec.rb", "spec/ap/parser_spec.rb", "spec/ap/search_spec.rb", "spec/ap_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.7.7"])
      s.add_development_dependency(%q<rspec>, [">= 2.5.0"])
      s.add_development_dependency(%q<webmock>, [">= 1.6.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
    else
      s.add_dependency(%q<httparty>, [">= 0.7.7"])
      s.add_dependency(%q<rspec>, [">= 2.5.0"])
      s.add_dependency(%q<webmock>, [">= 1.6.2"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.7.7"])
    s.add_dependency(%q<rspec>, [">= 2.5.0"])
    s.add_dependency(%q<webmock>, [">= 1.6.2"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
  end
end
