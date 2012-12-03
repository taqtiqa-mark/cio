module Cio
  class Cli < Thor

    desc 'clean', 'Delete lock file, cache and install paths, then install'
    method_option :path,    :type => :string,  :aliases => "-p", :default => './',        :desc => 'Directory to install cookbooks to.'
    method_option :source,  :type => :string,  :aliases => "-s", :default => './Ciofile', :desc => 'Full path to any file with Ciofile contents.'
    def clean
      api = ::Cio::Api.new(self, :clean)
      api.config(options)
      api.version if options[:version]
      api.clean
      api
    end

  end
end


