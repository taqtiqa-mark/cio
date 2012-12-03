require 'cio/modules/dsl/include'

module Cio
  module Modules
    module Dsl

      #TODO: Make these included methods private
      include ::Cio::Modules::Dsl::Include

      # Parse a Ciofile
      def parse(filename)
        result = eval(File.read(filename), binding)
      end

      #
      # Methods present in a Ciofile.
      #
      def site(*args)
        ::Cio.manifest[:sites].push *args
        self
      end

      def cookbook(*args)
        hsh = args.extract_options!
        ckbk = case args.size
                 when 1
                   hsh.merge( {:name => args[0]} )
                 when 2
                   hsh.merge( {:name => args[0], :version => args[1]} )
                 when 3
                   hsh.merge( {:name => args[0], :version => args[1], :md5 => args[2]} )
                 else
                   hsh.merge( {:name => args.shift, :version => args.shift, :splat => args } )
                end
        ::Cio.manifest[:cookbooks] << ckbk
        self
      end

      class ::Array
        def extract_options!
          last.is_a?(::Hash) ? pop : {}
        end
      end

    end
  end
end
