require 'cio/modules/dsl'

module Cio
  class Dsl

    include ::Cio::Modules::Dsl

    def initialize(api_self, &block)
      raise ArgumentError.new("Expected an instance of Cio::Api. Received #{api_self.class}") unless api_self.is_a?(::Cio::Api)
      @api = api_self
      @cli = api_self.cli
      @script = block
      ::Cio.manifest ||= { :sites => [], :cookbooks => [] }
      define_singleton_method(:execute, block) if block_given?
      self
    end

  end
end
