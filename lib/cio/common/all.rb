require 'thor'
require 'observer'

require 'cio/version'

module Cio
  module Common
    module All

      # placeholders for logging. Activated in Api#config.
      def quiet(str); end
      def loud(str); end

    end
  end
end