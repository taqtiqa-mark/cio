module Cio
  class Cli < Thor
    class_option :quiet,   :type => :boolean, :aliases => '-q', :desc => 'Log some progress and all error messages to stdout or stderr.'
    class_option :loud,    :type => :boolean, :aliases => '-l', :desc => 'Log all progress and error messages to stdout or stderr.'
    class_option :raise,   :type => :string,  :aliases => '-r', :desc => 'Raise an Exception with given message.'
    class_option :version, :type => :boolean, :aliases => '-v', :desc => 'Log version to stdout.'
  end
end
