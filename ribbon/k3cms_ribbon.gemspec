# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'pathname'
require Pathname.new(__FILE__).dirname + "../lib/k3cms/version"

Gem::Specification.new do |s|
  s.name          = "k3cms_ribbon"
  s.summary       = %q{K3cms Ribbon}
  s.description   = %q{Provides the toolbar for editing, creating pages, etc.}
  s.homepage      = "http://k3cms.org/#{s.name}"

  s.authors       = `git shortlog --summary --numbered         | awk '{print $2, $3    }'`.split("\n")
  s.email         = `git shortlog --summary --numbered --email | awk '{print $2, $3, $4}'`.split("\n")

  s.add_dependency 'k3cms_core'
  s.add_dependency 'rails',        '~> 3.0.0'
  s.add_dependency 'activerecord', '~> 3.0.0'
  s.add_dependency 'haml', '= 3.0.25'
  s.add_dependency 'facets'
  s.add_dependency 'cells'
  s.add_development_dependency 'rspec', '~> 2.2.0'
  s.add_development_dependency 'rspec-rails', '~> 2.2.0'
  s.add_development_dependency 'sqlite3-ruby'
  s.add_development_dependency 'ruby-debug19'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.version       = K3cms::Version
  s.platform      = Gem::Platform::RUBY
end
