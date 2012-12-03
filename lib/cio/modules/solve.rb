module Cio
  module Modules
    module Solve

      def solve
        begin
          res = []
          changed if logging
          cli.quiet 'Start task api: solve'
          raise(Exception.new(cli.options[:raise])) if cli.options[:raise]
          # Add functionality here.

          cli.loud "Results: #{res.inspect}"
        rescue Exception => e
          cli.quiet "Cio caught exception #{e.message}"
          cli.quiet e.backtrace.join('/n')
        ensure
          cli.quiet 'End task api: solve'
          notify_observers(cli.log) if logging
        end
        self
      end

    end
  end
end
