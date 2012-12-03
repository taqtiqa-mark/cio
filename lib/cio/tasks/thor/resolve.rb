module Cio
  class Cli < Thor

    desc 'resolve', 'Resolves specified cookbooks'
    method_option :source,  :type => :string,  :aliases => "-s", :default => './Ciofile', :desc => 'Full path to any file with Ciofile contents.'
    def resolve
      api = ::Cio::Api.new(self, :resolve)
      api.config(options)
      api.version if options[:version]
      api.parse_dsl_file
      api.solve
      api
    end

  end
end


