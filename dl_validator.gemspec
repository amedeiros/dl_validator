# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dl_validator/version'

Gem::Specification.new do |spec|
  spec.name          = 'dl_validator'
  spec.version       = DlValidator::VERSION
  spec.authors       = ['Andrew Medeiros']
  spec.email         = ['amedeiros0920@gmail.com']
  spec.description   = %q{DlValidator is a small gem that performs soft checks against a drivers license number and state. This is used only to flag a drivers license as being invalid, and is not intended to be considered true denial on a drivers license number.}
  spec.summary       = %q{DlValidator is a small gem that performs soft checks against a drivers license number and state. This is used only to flag a drivers license as being invalid, and is not intended to be considered true denial on a drivers license number.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'shoulda'
  spec.add_development_dependency 'test-unit'
end
