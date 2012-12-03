location = File.join(::Cio::Cli.source_root, 'tasks','thor','**','*.rb')
thor_files = Dir.glob(location).delete_if { |x| not File.file?(x) }
thor_files.each { |f| require f }
