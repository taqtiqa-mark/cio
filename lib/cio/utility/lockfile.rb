module Cio
  module Utility
    module Lockfile


      def lockfile
        @lockfile ||= self
      end

      def overwrite
        ::File.open( ::Cio.lockfile, 'w') {|f| f.write(contents) }
      end

     private

      def contents
        'lockfile contents'
      end

    end
  end
end
