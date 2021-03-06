module Cio
  class Cli < Thor

    desc 'verify', 'Verify resolved and installed cookbooks'
    method_option :path,    :type => :string,  :aliases => "-p", :default => './',        :desc => 'Directory to install cookbooks to.'
    method_option :source,  :type => :string,  :aliases => "-s", :default => './Ciofile', :desc => 'Full path to any file with Ciofile contents.'
    def verify
      api = ::Cio::Api.new(self, :verify)
      say ::Cio.version if options[:version]
      api.config(options)
      api.version if options[:version]
      api.parse_dsl_file
      api.solve
      api.get
      api.verify
      api
    end

  end
end


