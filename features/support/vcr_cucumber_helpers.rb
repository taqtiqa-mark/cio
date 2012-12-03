require 'date'

# This file gets symlinked into the tmp/aruba directory before
# each scenario so that it is available to be required in them.
$LOAD_PATH << '../../spec' unless $LOAD_PATH.include?('../../spec')
$LOAD_PATH.unshift '../../lib'  unless $LOAD_PATH.include?('../../lib')

running_under_aruba = File.expand_path('.').include?('aruba')
if running_under_aruba
  require 'support/monkey_patches'
  require 'vcr/util/internet_connection'

  # pretend we're always on the internet (so that we don't have an
  # internet connection dependency for our cukes)
  VCR::InternetConnection.class_eval do
    def available?; true; end
  end
end

if ENV['DATE_STRING']
  require 'timecop'
  Timecop.travel(Date.parse(ENV['DATE_STRING']))
end
