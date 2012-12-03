source 'https://rubygems.org'

gem "appraisal", "~> 0.5.1"

# Specify your gem's runtime dependencies in cio.gemspec
gemspec

# Development gems follow

gem 'jruby-openssl', :platforms => :jruby

gem 'yard'

# BDD specific gems
group :bdd do
  gem 'aruba'
  gem 'cucumber'
  gem 'fakefs'
  gem 'fakeweb'
  gem 'file-tail'
  gem 'rr'
  gem 'rspec'
  gem 'ruby_parser'
  gem 'simplecov', :require => false
  gem 'sourcify'
  gem 'vcr'
end

# Useful, but not required for development.
group :extras do
  gem 'relish'
  gem 'travis-lint'
  gem 'ruby-debug', :platforms => [:mri_18, :jruby]
  gem 'debugger', :platforms => :mri_19
end