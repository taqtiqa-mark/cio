module Cio
  class Cli < Thor

    desc 'update', 'Resolves and updates specified cookbooks'
    method_option :path,    :type => :string,  :aliases => "-p", :default => './',        :desc => 'Directory to install cookbooks to.'
    method_option :source,  :type => :string,  :aliases => "-s", :default => './Ciofile', :desc => 'Full path to any file with Ciofile contents.'
    def update
      api = ::Cio::Api.new(self, :update)
      say ::Cio.version if options[:version]
      api.config(options)
      api.version if options[:version]
      api.parse_dsl_file
      api.solve
      api.get
      api.verify
      api.update
      api
    end

  end
end


