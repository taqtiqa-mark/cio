module Cio
  module Modules
    module Update

      def update
        begin
          res = []
          changed if logging
          cli.quiet 'Start task api: update'
          raise(Exception.new(cli.options[:raise])) if cli.options[:raise]
          # Add functionality here.

          cli.loud "Results: #{res.inspect}"
        rescue Exception => e
          cli.quiet "Cio caught exception #{e.message}"
          cli.quiet e.backtrace.join('/n')
        ensure
          cli.quiet 'End task api: update'
          notify_observers(cli.log) if logging
        end
        self
      end

    end
  end
end
