# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slashdot/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-slashdot"
  spec.version       = Slashdot::VERSION
  spec.authors       = ["dtan4"]
  spec.email         = ["dtanshi45@gmail.com"]
  spec.summary       = %q{Ruby Client for Slashdot}
  spec.description   = %q{Ruby Client for Slashdot}
  spec.homepage      = "https://github.com/dtan4/ruby-slashdot"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "webmock"
end
