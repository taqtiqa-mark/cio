module Cio
  class Cli < Thor

    desc 'version', 'Cio version'
    def version
      api = ::Cio::Api.new(self, :version)
      api.config(options)
      api.version
      api
    end

  end
end


