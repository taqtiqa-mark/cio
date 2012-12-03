# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cio/version'

Gem::Specification.new do |gem|
  gem.name          = 'cio'
  gem.version       = Cio.version
  gem.date          = Time.now.strftime('%Y-%m-%d')
  gem.authors       = ['Mark Van de Vyver']
  gem.email         = %w(coders@taqtiqa.com)
  gem.description   = %q{Bundling cookbooks for production deployments. Fast. Reliable.}
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/taqtiqa/cio'
  gem.licenses      = %w(MIT)
  gem.rubyforge_project = 'cio'

  gem.has_rdoc         = 'yard'
  gem.rdoc_options     = %w(--charset=UTF-8)
  gem.extra_rdoc_files = %w(CHANGELOG.rdoc LICENSE.md README.md Thorfile)

  gem.add_runtime_dependency 'archive-tar-minitar', '~> 0.5.2'
  gem.add_runtime_dependency 'faraday', '~> 0.8.0'
  gem.add_runtime_dependency 'json'
  gem.add_runtime_dependency 'ruby-xz', '~> 0.1.1'
  gem.add_runtime_dependency 'solve', '~> 0.4.0'
  gem.add_runtime_dependency 'thor'
  gem.add_runtime_dependency 'typhoeus', '~> 0.5.2'

  gem.platform                  = Gem::Platform::RUBY
  gem.files                     = Dir['{lib}/**/*.rb', '{lib}/**/*.rake', 'LICENSE', 'README.md']
  gem.executables               = %w(cio)
  gem.bindir                    = 'bin'
  gem.test_files                = gem.files.grep(%r{^(spec|features)/})
  gem.require_paths             = %w(lib)
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6') if gem.respond_to? :required_rubygems_version=
  gem.required_ruby_version     = '>= 1.9.1'
end
