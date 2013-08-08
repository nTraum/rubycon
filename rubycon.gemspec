# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','rubycon','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'rubycon'
  s.license = 'MIT'
  s.version = Rubycon::VERSION
  s.author = 'Philipp Preß'
  s.email = 'philipp.press@googlemail.com'
  s.homepage = 'https://github.com/nTraum/rubycon'
  s.platform = Gem::Platform::RUBY
  s.summary = 'CLI to manage your Source dedicated game servers.'
  s.description = s.summary
  s.files = `git ls-files`.split($/)
  s.test_files  = Dir.glob("{spec,test}/**/*.rb")

  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'rubycon'
  s.requirements << 'libbzip2'
  s.requirements << 'libreadline'
  s.add_dependency              'colored',          '~> 1.2'
  s.add_dependency              'gli',              '~> 2.5'
  s.add_dependency              'highline',         '~> 1.6'
  s.add_dependency              'parallel',         '~> 0.7'
  s.add_dependency              'steam-condenser',  '~> 1.3'
  s.add_development_dependency  'minitest'
  s.add_development_dependency  'minitest-reporters'
  s.add_development_dependency  'rake'
end