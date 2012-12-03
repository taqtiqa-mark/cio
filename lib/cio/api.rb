require 'cio/common/all'
require 'cio/common/api'
require 'cio/modules/config'
require 'cio/modules/clean'
require 'cio/modules/dsl'
require 'cio/modules/get'
require 'cio/modules/install'
require 'cio/modules/parse_dsl_file'
require 'cio/modules/solve'
require 'cio/modules/update'
require 'cio/modules/verify'
require 'cio/modules/version'

module Cio
  class Api

    include ::Cio::Common::All
    include ::Cio::Common::Api
    include ::Cio::Modules::Config
    include ::Cio::Modules::Dsl
    include ::Cio::Modules::Clean
    include ::Cio::Modules::Get
    include ::Cio::Modules::Install
    include ::Cio::Modules::ParseDslFile
    include ::Cio::Modules::Solve
    include ::Cio::Modules::Update
    include ::Cio::Modules::Verify
    include ::Cio::Modules::Version

    include ::Observable

    attr_accessor :cli, :task, :logging, :log

    def initialize(cli_self, cli_task=:help)
      @cli = cli_self
      @task = cli_task
      @log = []
      set_logging(cli.options)
      activate_logging()

      self
    end

    private

    def activate_logging
      cli.log = []
      case @logging
        when :quiet
          unless @quiet
            def cli.quiet(str); @log << str; end
            def cli.loud(str); end
            ::Cio::Utility::Log::Observer.new(cli, self, task)
            cli.quiet '---'
            cli.quiet 'Log level quiet'
            @quiet = true
          end
        when :loud
          unless @loud
            def cli.quiet(str); @log << str; end
            def cli.loud(str); @log << str; end
            def cli.say(*args)
              loud inspect
              loud 'About to say:'
              loud args
              super
            end
            ::Cio::Utility::Log::Observer.new(cli, self, task)
            cli.loud '---'
            cli.loud 'Log level loud'
            @loud = true
          end
      end
    end

    def set_logging(options)
      if options[:loud]
        @logging = :loud
      elsif options[:quiet]
        @logging = :quiet
      else
        @logging = false
      end
    end

  end
end