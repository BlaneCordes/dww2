# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{coderay}
  s.version = "1.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kornelius Kalnbach"]
  s.date = %q{2012-06-25}
  s.default_executable = %q{coderay}
  s.description = %q{Fast and easy syntax highlighting for selected languages, written in Ruby. Comes with RedCloth integration and LOC counter.}
  s.email = ["murphy@rubychan.de"]
  s.executables = ["coderay"]
  s.extra_rdoc_files = ["README_INDEX.rdoc"]
  s.files = ["README_INDEX.rdoc", "Rakefile", "lib/coderay.rb", "lib/coderay/duo.rb", "lib/coderay/encoder.rb", "lib/coderay/encoders/_map.rb", "lib/coderay/encoders/comment_filter.rb", "lib/coderay/encoders/count.rb", "lib/coderay/encoders/debug.rb", "lib/coderay/encoders/div.rb", "lib/coderay/encoders/filter.rb", "lib/coderay/encoders/html.rb", "lib/coderay/encoders/html/css.rb", "lib/coderay/encoders/html/numbering.rb", "lib/coderay/encoders/html/output.rb", "lib/coderay/encoders/json.rb", "lib/coderay/encoders/lines_of_code.rb", "lib/coderay/encoders/null.rb", "lib/coderay/encoders/page.rb", "lib/coderay/encoders/span.rb", "lib/coderay/encoders/statistic.rb", "lib/coderay/encoders/terminal.rb", "lib/coderay/encoders/text.rb", "lib/coderay/encoders/token_kind_filter.rb", "lib/coderay/encoders/xml.rb", "lib/coderay/encoders/yaml.rb", "lib/coderay/for_redcloth.rb", "lib/coderay/helpers/file_type.rb", "lib/coderay/helpers/gzip.rb", "lib/coderay/helpers/plugin.rb", "lib/coderay/helpers/word_list.rb", "lib/coderay/scanner.rb", "lib/coderay/scanners/_map.rb", "lib/coderay/scanners/c.rb", "lib/coderay/scanners/clojure.rb", "lib/coderay/scanners/cpp.rb", "lib/coderay/scanners/css.rb", "lib/coderay/scanners/debug.rb", "lib/coderay/scanners/delphi.rb", "lib/coderay/scanners/diff.rb", "lib/coderay/scanners/erb.rb", "lib/coderay/scanners/groovy.rb", "lib/coderay/scanners/haml.rb", "lib/coderay/scanners/html.rb", "lib/coderay/scanners/java.rb", "lib/coderay/scanners/java/builtin_types.rb", "lib/coderay/scanners/java_script.rb", "lib/coderay/scanners/json.rb", "lib/coderay/scanners/php.rb", "lib/coderay/scanners/python.rb", "lib/coderay/scanners/raydebug.rb", "lib/coderay/scanners/ruby.rb", "lib/coderay/scanners/ruby/patterns.rb", "lib/coderay/scanners/ruby/string_state.rb", "lib/coderay/scanners/sql.rb", "lib/coderay/scanners/text.rb", "lib/coderay/scanners/xml.rb", "lib/coderay/scanners/yaml.rb", "lib/coderay/style.rb", "lib/coderay/styles/_map.rb", "lib/coderay/styles/alpha.rb", "lib/coderay/token_kinds.rb", "lib/coderay/tokens.rb", "lib/coderay/tokens_proxy.rb", "lib/coderay/version.rb", "test/functional/basic.rb", "test/functional/examples.rb", "test/functional/for_redcloth.rb", "test/functional/suite.rb", "bin/coderay"]
  s.homepage = %q{http://coderay.rubychan.de}
  s.rdoc_options = ["-SNw2", "-mREADME_INDEX.rdoc", "-t CodeRay Documentation"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.6")
  s.rubyforge_project = %q{coderay}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Fast syntax highlighting for selected languages.}
  s.test_files = ["test/functional/basic.rb", "test/functional/examples.rb", "test/functional/for_redcloth.rb", "test/functional/suite.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
