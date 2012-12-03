module ::Cio
  class Cli < ::Thor

    include ::Cio::Common::All

    include ::Thor::Actions
    include ::Observable

    attr_accessor :log

    def initialize(*args)
      # super is to be called last
      super
    end

    # The source root is one level up from where we are now.
    # Reference:
    # https://github.com/wycats/thor/wiki/Actions
    def self.source_root
      File.dirname(File.dirname(__FILE__))
    end

  end
end
