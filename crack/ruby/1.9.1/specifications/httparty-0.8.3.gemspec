# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{httparty}
  s.version = "0.8.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker", "Sandro Turriate"]
  s.date = %q{2012-04-22}
  s.default_executable = %q{httparty}
  s.description = %q{Makes http fun! Also, makes consuming restful web services dead easy.}
  s.email = ["nunemaker@gmail.com"]
  s.executables = ["httparty"]
  s.files = [".gitignore", ".travis.yml", "Gemfile", "Guardfile", "History", "MIT-LICENSE", "README.rdoc", "Rakefile", "bin/httparty", "cucumber.yml", "examples/aaws.rb", "examples/basic.rb", "examples/crack.rb", "examples/custom_parsers.rb", "examples/delicious.rb", "examples/google.rb", "examples/headers_and_user_agents.rb", "examples/nokogiri_html_parser.rb", "examples/rubyurl.rb", "examples/tripit_sign_in.rb", "examples/twitter.rb", "examples/whoismyrep.rb", "features/basic_authentication.feature", "features/command_line.feature", "features/deals_with_http_error_codes.feature", "features/digest_authentication.feature", "features/handles_compressed_responses.feature", "features/handles_multiple_formats.feature", "features/steps/env.rb", "features/steps/httparty_response_steps.rb", "features/steps/httparty_steps.rb", "features/steps/mongrel_helper.rb", "features/steps/remote_service_steps.rb", "features/supports_redirection.feature", "features/supports_timeout_option.feature", "httparty.gemspec", "lib/httparty.rb", "lib/httparty/cookie_hash.rb", "lib/httparty/core_extensions.rb", "lib/httparty/exceptions.rb", "lib/httparty/hash_conversions.rb", "lib/httparty/module_inheritable_attributes.rb", "lib/httparty/net_digest_auth.rb", "lib/httparty/parser.rb", "lib/httparty/request.rb", "lib/httparty/response.rb", "lib/httparty/response/headers.rb", "lib/httparty/version.rb", "spec/fixtures/delicious.xml", "spec/fixtures/empty.xml", "spec/fixtures/google.html", "spec/fixtures/ssl/generate.sh", "spec/fixtures/ssl/generated/1fe462c2.0", "spec/fixtures/ssl/generated/bogushost.crt", "spec/fixtures/ssl/generated/ca.crt", "spec/fixtures/ssl/generated/ca.key", "spec/fixtures/ssl/generated/selfsigned.crt", "spec/fixtures/ssl/generated/server.crt", "spec/fixtures/ssl/generated/server.key", "spec/fixtures/ssl/openssl-exts.cnf", "spec/fixtures/twitter.json", "spec/fixtures/twitter.xml", "spec/fixtures/undefined_method_add_node_for_nil.xml", "spec/httparty/cookie_hash_spec.rb", "spec/httparty/net_digest_auth_spec.rb", "spec/httparty/parser_spec.rb", "spec/httparty/request_spec.rb", "spec/httparty/response_spec.rb", "spec/httparty/ssl_spec.rb", "spec/httparty_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/support/ssl_test_helper.rb", "spec/support/ssl_test_server.rb", "spec/support/stub_response.rb", "website/css/common.css", "website/index.html"]
  s.homepage = %q{http://httparty.rubyforge.org/}
  s.post_install_message = %q{When you HTTParty, you must party hard!}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Makes http fun! Also, makes consuming restful web services dead easy.}
  s.test_files = ["features/basic_authentication.feature", "features/command_line.feature", "features/deals_with_http_error_codes.feature", "features/digest_authentication.feature", "features/handles_compressed_responses.feature", "features/handles_multiple_formats.feature", "features/steps/env.rb", "features/steps/httparty_response_steps.rb", "features/steps/httparty_steps.rb", "features/steps/mongrel_helper.rb", "features/steps/remote_service_steps.rb", "features/supports_redirection.feature", "features/supports_timeout_option.feature", "spec/fixtures/delicious.xml", "spec/fixtures/empty.xml", "spec/fixtures/google.html", "spec/fixtures/ssl/generate.sh", "spec/fixtures/ssl/generated/1fe462c2.0", "spec/fixtures/ssl/generated/bogushost.crt", "spec/fixtures/ssl/generated/ca.crt", "spec/fixtures/ssl/generated/ca.key", "spec/fixtures/ssl/generated/selfsigned.crt", "spec/fixtures/ssl/generated/server.crt", "spec/fixtures/ssl/generated/server.key", "spec/fixtures/ssl/openssl-exts.cnf", "spec/fixtures/twitter.json", "spec/fixtures/twitter.xml", "spec/fixtures/undefined_method_add_node_for_nil.xml", "spec/httparty/cookie_hash_spec.rb", "spec/httparty/net_digest_auth_spec.rb", "spec/httparty/parser_spec.rb", "spec/httparty/request_spec.rb", "spec/httparty/response_spec.rb", "spec/httparty/ssl_spec.rb", "spec/httparty_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/support/ssl_test_helper.rb", "spec/support/ssl_test_server.rb", "spec/support/stub_response.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_runtime_dependency(%q<multi_xml>, [">= 0"])
    else
      s.add_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_dependency(%q<multi_xml>, [">= 0"])
    end
  else
    s.add_dependency(%q<multi_json>, ["~> 1.0"])
    s.add_dependency(%q<multi_xml>, [">= 0"])
  end
end
