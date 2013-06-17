# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','rubycon','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'rubycon'
  s.version = Rubycon::VERSION
  s.author = 'Philipp Preß'
  s.email = 'philipp.press@googlemail.com'
  s.homepage = 'https://github.com/nTraum/rubycon'
  s.platform = Gem::Platform::RUBY
  s.summary = 'CLI to manage your Source dedicated game servers.'
  s.files = `git ls-files`.split($/)

  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'rubycon'
  s.add_development_dependency('aruba')
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_runtime_dependency('gli','2.5.6')
  s.add_runtime_dependency('highline')
  s.add_runtime_dependency('steam-condenser')
  s.add_runtime_dependency('colored')
  s.add_runtime_dependency('parallel')
end
