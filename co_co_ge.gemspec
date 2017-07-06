# -*- encoding: utf-8 -*-
# stub: co_co_ge 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "co_co_ge".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Florian Frank".freeze]
  s.date = "2017-07-06"
  s.description = "This library creates (un-)readable coupon codes.".freeze
  s.email = "flori@ping.de".freeze
  s.extra_rdoc_files = ["README.md".freeze, "lib/co_co_ge.rb".freeze, "lib/co_co_ge/code_generator.rb".freeze, "lib/co_co_ge/ngrams_symbol_generator.rb".freeze, "lib/co_co_ge/version.rb".freeze, "lib/co_co_ge/words_symbol_generator.rb".freeze]
  s.files = [".gitignore".freeze, ".travis.yml".freeze, ".utilsrc".freeze, "COPYING".freeze, "Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "VERSION".freeze, "co_co_ge.gemspec".freeze, "code.gemspec".freeze, "lib/co_co_ge.rb".freeze, "lib/co_co_ge/code_generator.rb".freeze, "lib/co_co_ge/ngrams_symbol_generator.rb".freeze, "lib/co_co_ge/version.rb".freeze, "lib/co_co_ge/words_symbol_generator.rb".freeze, "spec/co_co_ge/code_generator_spec.rb".freeze, "spec/co_co_ge/ngrams_symbol_generator_spec.rb".freeze, "spec/co_co_ge/words_symbol_generator_spec.rb".freeze, "spec/spec_helper.rb".freeze]
  s.homepage = "https://github.com/flori/co_co_ge".freeze
  s.rdoc_options = ["--title".freeze, "CoCoGe".freeze, "--main".freeze, "README.md".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Create a (un-)readable coupon code".freeze
  s.test_files = ["spec/co_co_ge/code_generator_spec.rb".freeze, "spec/co_co_ge/ngrams_symbol_generator_spec.rb".freeze, "spec/co_co_ge/words_symbol_generator_spec.rb".freeze, "spec/spec_helper.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<gem_hadar>.freeze, ["~> 1.9.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<gem_hadar>.freeze, ["~> 1.9.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<gem_hadar>.freeze, ["~> 1.9.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
