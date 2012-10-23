# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'biblia/version'

Gem::Specification.new do |gem|
  gem.name          = "biblia"
  gem.version       = Biblia::VERSION
  gem.authors       = ["John Moody"]
  gem.email         = ["john@mentalvelocity.com"]
  gem.description   = %q{Ruby wrapper for the Biblia.com API}
  gem.summary       = %q{The Biblia gem provides an easy-to-use Ruby wrapper for the Biblia.com API.}
  gem.homepage      = "http://mentalvelocity.com/products/biblia"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'httparty'
  
end
