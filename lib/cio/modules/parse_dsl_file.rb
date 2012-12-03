module Cio
  module Modules
    module ParseDslFile

      def parse_dsl_file
        ::Cio::Dsl.new(self).parse(::Cio.file)
        self
      end

    end
  end
end
