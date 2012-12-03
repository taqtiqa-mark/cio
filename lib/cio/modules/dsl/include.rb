# Source:
# https://gist.github.com/154550
require 'cio/modules/dsl/cov_excluded'

module Cio
  module Modules
    module Dsl
      module Include

        include ::Cio::Modules::Dsl::CovExcluded

        attr_accessor :script, :api, :cli

        def script_receiver
          script.binding.eval('self')
        end

        def script_metaclass
          (class << script_receiver; self; end)
        end

        def mixout!
          script_metaclass.send :define_method, :method_missing,
                                &@script_old_method_missing
        end

        def with_mixin &block
          mixin!
          instance_eval &block
        ensure
          mixout!
        end

        def go!
          with_mixin &script
        end

      end
    end
  end
end