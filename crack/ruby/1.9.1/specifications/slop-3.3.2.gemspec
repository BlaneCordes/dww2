# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{slop}
  s.version = "3.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lee Jarvis"]
  s.date = %q{2012-06-26}
  s.description = %q{A simple DSL for gathering options and parsing the command line}
  s.email = %q{lee@jarvis.co}
  s.files = [".gitignore", ".travis.yml", "CHANGES.md", "Gemfile", "LICENSE", "README.md", "Rakefile", "lib/slop.rb", "lib/slop/commands.rb", "lib/slop/option.rb", "slop.gemspec", "test/commands_test.rb", "test/helper.rb", "test/option_test.rb", "test/slop_test.rb"]
  s.homepage = %q{http://github.com/injekt/slop}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Option gathering made easy}
  s.test_files = ["test/commands_test.rb", "test/helper.rb", "test/option_test.rb", "test/slop_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
