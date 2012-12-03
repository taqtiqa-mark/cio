module Cio
  module Modules
    module Version

      def version
        begin
          res = []
          changed if logging
          cli.quiet 'Start task api: version'
          raise(Exception.new(cli.options[:raise])) if cli.options[:raise]
          cli.say(::Cio.version) if (task == :version || cli.options[:version])
        rescue Exception => e
          cli.quiet "Cio caught exception #{e.message}"
          cli.quiet e.backtrace.join('/n')
        ensure
          cli.quiet 'End task api: version'
          notify_observers(cli.log) if logging
        end
        self
      end

    end
  end
end
