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
# Add your other files here if you make them
  s.files = %w(
bin/rubycon
lib/rubycon/version.rb
lib/rubycon.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','rubycon.rdoc']
  s.rdoc_options << '--title' << 'rubycon' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'rubycon'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.5.6')
  s.add_runtime_dependency('steam-condenser')
end
