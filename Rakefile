# vim: set filetype=ruby et sw=2 ts=2:

require 'gem_hadar'

GemHadar do
  name        'co_co_ge'
  author      'Florian Frank'
  email       'flori@ping.de'
  homepage    "https://github.com/flori/#{name}"
  summary     'Create a (un-)readable coupon code'
  description 'This library creates (un-)readable coupon codes.'
  test_dir    'spec'
  ignore      '.*.sw[pon]', 'pkg', 'Gemfile.lock', 'coverage', '.rvmrc',
    '.AppleDouble', 'tags', '.byebug_history', '.DS_Store', 'errors.lst',
    'probe.socket'
  readme      'README.md'
  title       "#{name.camelize}"

  required_ruby_version '>= 2.3'
  development_dependency 'rake'
  development_dependency 'rspec'
end

task :default => :spec
