module Cio
  class Cli < Thor
    desc 'install', 'Resolves and installs specified cookbooks'
    method_option :clean,   :type => :boolean, :aliases => "-c",                          :desc => 'Delete lock file, cache and install paths, then install.'
    method_option :path,    :type => :string,  :aliases => "-p", :default => './',        :desc => 'Directory to install cookbooks to.'
    method_option :source,  :type => :string,  :aliases => "-s", :default => './Ciofile', :desc => 'Full path to any file with Ciofile contents.'
    def install
      api = ::Cio::Api.new(self, :install)
      api.config(options)
      api.version  if options[:version]
      api.clean if options[:clean]
      api.parse_dsl_file
      api.solve
      api.get
      api.verify
      api.install
      api
    end
  end
end


