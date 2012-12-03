require 'cio/utility/lockfile'

module Cio
  module Modules
    module Install

      include ::Cio::Utility::Lockfile

      def install
        begin
          res = []
          changed if logging
          cli.quiet 'Start task api: install'
          raise(Exception.new(cli.options[:raise])) if cli.options[:raise]
          # Add functionality here.
          res << lockfile.overwrite

          cli.loud "Results: #{res.inspect}"
        rescue Exception => e
          cli.quiet "Cio caught exception #{e.message}"
          cli.quiet e.backtrace.join('/n')
        ensure
          cli.quiet 'End task api: install'
          notify_observers(cli.log) if logging
        end
        self
      end

    end
  end
end
