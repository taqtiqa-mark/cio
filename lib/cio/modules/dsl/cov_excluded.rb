# These are xcluded from simplecov metrics.
# Reason is given in a comment.
module ::Cio
  module Modules
    module Dsl
      module CovExcluded

        def mixin!
          @script_old_method_missing = script_receiver.method :method_missing
          dsl = ::Cio::Dsl.new(api)
          script_metaclass.send :define_method, :method_missing do |m, *a, &b|
            # This block is not currently tested. Pull requests welcome.
            if dsl.respond_to?(m)
              dsl.send m, *a, &b
            else
              @script_old_method_missing.call m, *a, &b
            end
          end
        end

      end
    end
  end
end
