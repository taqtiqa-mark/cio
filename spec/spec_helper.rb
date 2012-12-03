unless ENV['TRAVIS']
  require 'simplecov'
  SimpleCov.root(File.dirname(File.dirname(__FILE__)))
  SimpleCov.command_name "specs"
end

require 'aruba/api'

require 'cio'

Dir['./spec/support/**/*.rb'].sort.each{|f| require f }

module ::FakeFSTrigger
# http://stackoverflow.com/questions/4568143/how-do-i-configure-integration-tests-using-rspec-2
  def self.included(base)
    RSpec.configure do |config|
      config.before(:suite) do
        require 'fakefs/spec_helpers'
        config.include ::FakeFS::SpecHelpers
        config.include ::Cio::Spec::Support::Helpers::Include
        config.extend ::Cio::Spec::Support::Helpers::Extend
        ::FakeFS.activate!
        puts '  Loaded fakefs/spec_helpers'
      end
      config.before(:each) do
        ::FakeFS.activate!
        puts '  Loaded fakefs/spec_helpers'
      end
      config.after(:each) do
        ::FakeFS::FileSystem.clear
        ::FakeFS.deactivate!
      end
      config.after(:suite) do
        ::FakeFS::FileSystem.clear
        ::FakeFS.deactivate!
      end
    end
  end
end

RSpec.configure do |c|
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
  c.mock_with :rr #::RR::Adapters::Rspec
  c.mock_framework = ::RSpec::Core::MockFrameworkAdapter
  c.backtrace_clean_patterns.push(::RR::Errors::BACKTRACE_IDENTIFIER)
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.run_all_when_everything_filtered = true
  c.filter_run :focus
  c.alias_it_should_behave_like_to :it_validates, "it validates"
  c.include ::FakeFSTrigger, :type => :fakefs
  c.include ::Cio::Spec::Support::Helpers::Include
  c.extend ::Cio::Spec::Support::Helpers::Extend
  c.after(:suite) do
    # Keep examples idempotent: Class/Module attributes persist between examples
    ::Cio.file = nil
    ::Cio.lockfile = nil
  end
#  config.before(:suite, :type => :fakefs ) do
#    require 'fakefs/spec_helpers'
#    config.include ::FakeFS::SpecHelpers
#    config.include ::Cio::Spec::Support::Helpers::Include
#    config.extend ::Cio::Spec::Support::Helpers::Extend
#    ::FakeFS.activate!
#    puts '  Loaded fakefs/spec_helpers'
#  end
#  config.before(:each) do
#    ::FakeFS.activate!
#    puts '  Loaded fakefs/spec_helpers'
#  end
#  config.after(:each) do
#    ::FakeFS::FileSystem.clear
#    ::FakeFS.deactivate!
#  end
#  config.after(:suite) do
#    ::FakeFS::FileSystem.clear
#    ::FakeFS.deactivate!
#  end
#end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  #c.order = 'random'
end
