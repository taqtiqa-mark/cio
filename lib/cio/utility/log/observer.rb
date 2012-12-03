module Cio
  module Utility
    module Log
      class Observer

        include ::Cio::Utility::Log

        # Return the instance of the the observable class passed in.
        def initialize(cli, api, task)
          @cli, @api, @task = cli, api, task
          cli.add_observer(self)
          api.add_observer(self)
        end

        # callback for observer. Which this class is, via ::Cio::Utility::Log
        def update(lines=[])
          # http://stackoverflow.com/questions/6549074/whats-the-fastest-way-to-build-a-string-in-ruby
          $stdout.puts lines
        end

      end
    end
  end
end
