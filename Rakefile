using_git = File.exist?(File.expand_path('../.git/', __FILE__))

if using_git
  require 'bundler'
  require 'bundler/setup'
  Bundler::GemHelper.install_tasks
  require 'appraisal'
end

require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false

  # we require spec_helper so we don't get an RSpec warning about
  # examples being defined before configuration.
  t.ruby_opts = '-w -I./spec -r./spec/support/capture_warnings -rspec_helper'
  t.rspec_opts = %w[--format progress] if (ENV['FULL_BUILD'] || !using_git)
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new

task :default => [:spec, :cucumber]

desc 'Ensure we keep up 100% YARD coverage'
task :yard_coverage do
  coverage_stats = `yard stats --list-undoc 2>&1`
  puts coverage_stats
  if coverage_stats.include?('100.00% documented')
    puts '\nNice work! 100% documentation coverage'
  else
    raise 'Documentation coverage is less than 100%'
  end
end

desc 'Checks the spec coverage and fails if it is less than 100%'
task :spec_coverage do
  if RUBY_VERSION < '1.9' || RUBY_ENGINE != 'ruby'
    puts 'Cannot check code coverage--simplecov is not supported on this platform'
  else
    percent = File.read('./spec/support/percent.txt').to_f
    if percent < 98.0
      raise "Spec coverage was not high enough: #{percent.round(2)}%"
    else
      puts 'Nice job! Spec coverage is still above 98%'
    end
  end
end

namespace :ci do
  desc 'Set up for ci build on travis-ci.org'
  task :setup do
    ENV['TRAVIS'] = 'true'
  end

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = true

    # we require spec_helper so we don't get an RSpec warning about
    # examples being defined before configuration.
    t.ruby_opts = '-w -I./spec -r./spec/support/capture_warnings -rspec_helper'
    t.rspec_opts = %w[--format progress --backtrace]
  end

  desc 'Run a ci build'
  task :build => [:setup, :spec, :cucumber, :yard_coverage, :spec_coverage]
end

def ensure_relish_doc_symlinked(filename)
  from_filename = filename.dup
  from_filename << '.md' unless filename =~ /\.md$/
  from = File.expand_path("../features/#{from_filename}", __FILE__)
  to = File.expand_path("../#{filename}", __FILE__)

  if File.symlink?(from)
    return if File.readlink(from) == to

    # delete the old symlink
    File.unlink(from)
  end

  FileUtils.ln_s to, from
end

desc 'Push cukes to relishapp using the relish-client-gem'
task :relish do
  %w[ README.md CHANGELOG.md LICENSE CONTRIBUTING.md].each do |file|
    ensure_relish_doc_symlinked(file)
  end

  require 'cio/version'
  sh "relish versions:add taqtiqa/cio:#{Cio.version}" if ENV['NEW_RELISH_RELEASE']
  sh "relish push cio:#{Cio.version}"
end

task :prep_relish_release do
  ENV['NEW_RELISH_RELEASE'] = 'true'
end

task :require_ruby_18 do
  raise 'This must be run on Ruby 1.8' unless RUBY_VERSION =~ /^1\.8/
end

task :release => [:require_ruby_18, :prep_relish_release, :relish]

# For gem-test: http://gem-testers.org/
task :test => :spec

namespace :cio do
  task :reset_spec_cassettes do
    ENV['DIR'] = 'spec/fixtures'
  end
end

desc 'Run the last cuke directly'
task :run_last_cuke do
  command = ENV.fetch('CMD') do
    raise 'Must pass CMD'
  end

  Dir.chdir('tmp/aruba') do
    sh "RUBYOPT='-I.:../../lib -r../../features/support/vcr_cucumber_helpers' ruby #{command}"
  end
end

#desc 'Boot test app'
#task :boot_test_app do
#  require './spec/support/vcr_localhost_server'
#  require './spec/support/sinatra_app'
#  VCR::SinatraApp.boot
#  puts "Booted sinatra app on port: #{VCR::SinatraApp.port}"
#  loop { }
#  puts "Shutting down."
#end