# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubycon/version'

Gem::Specification.new do |gem|
  gem.name          = "rubycon"
  gem.version       = Rubycon::VERSION
  gem.authors       = ["nTraum"]
  gem.email         = ["philipp.press@googlemail.com"]
  gem.description   = "fdkvdbvdjkbjkd"
  gem.summary       = "dfbdklbklbklkl"
  gem.homepage      = "http://github.com/nTraum/rubycon"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('steam-condenser')
  gem.add_dependency('highline')
end
