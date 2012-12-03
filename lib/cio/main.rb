require 'cio/common/all'
require 'cio/utility'
require 'cio/api'
require 'cio/cli'
require 'cio/dsl'

module ::Cio
  attr_accessor :file, :cookbooks, :lockfile, :manifest
  module_function :file, :file=, :cookbooks, :cookbooks=, :lockfile, :lockfile=, :manifest, :manifest=
  # module_function makes these private methods:
  public :file, :file=, :cookbooks, :cookbooks=, :lockfile, :lockfile=, :manifest, :manifest=

end