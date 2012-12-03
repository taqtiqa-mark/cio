module Cio
  module Modules
    module Clean

      def clean
        begin
          res = []
          changed if logging
          cli.quiet 'Start task api: clean'
          raise(Exception.new(cli.options[:raise])) if cli.options[:raise]
          cli.loud "About to clean #{::Cio.cookbooks}"
          res << ::FileUtils.rm_rf(::Cio.cookbooks)
          cli.loud 'About to set ::Cio.cookbooks = nil'
          res << ::Cio.cookbooks = nil
          cli.loud "About to clean #{::Cio.lockfile}"
          res << ::FileUtils.rm_rf(::Cio.lockfile)
          cli.loud "Results: #{res.inspect}"
        rescue Exception => e
          cli.quiet "Cio caught exception #{e.message}"
          cli.quiet e.backtrace.join('/n')
        ensure
          cli.quiet 'End task api: clean'
          notify_observers(cli.log) if logging
        end
        self
      end

    end
  end
end
