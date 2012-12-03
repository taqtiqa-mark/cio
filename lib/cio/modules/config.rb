module Cio
  module Modules
    module Config

      # Configure source and lock file locations.
      # Activate quiet or loud logging levels.
      # @param [Object] options
      def config(options)
        assign_files(options)
        self
      end

      private

      def assign_files(options)
        ::Cio.file = file(:cio, options[:source])
        ::Cio.lockfile = file(:lock, options[:source])
        ::Cio.cookbooks = cookbooks_dir(:cookbooks, get_dir(options[:source]), options[:path])
      end

      def file(type, source = './Ciofile')
        # Handle a given option value of nil.
        # E.g. when source but not path options are used
        source ||= './Ciofile'
        dir    = get_dir( source )
        fn     = File.basename(source)
        cio_path(type, dir, fn)
      end

      def get_dir( option = './' )
        option ||= './'
        dir    = File.dirname(option)
        if dir == '.'
          Dir.getwd
        else
          dir
        end
      end

      def cookbooks_dir(type, src_dir, path )
        if path.nil?
          dir_root = src_dir
        elsif path[/^\.\/$/]
          dir_root = get_dir(path)
        end
        cio_path(type, dir_root, 'cookbooks')
      end

      #def custom_io_file_path(type, root, custom)
      #  if custom[/^\.\/Ciofile$/]
      #    cio_file_path(type, root)
      #  else
      #    cio_file_path(type, root, custom)
      #  end
      #end

      def cio_path(type, root, custom='Ciofile')
        name = case type
                 when :cio then custom
                 when :lock then "#{custom}.lock"
                 when :cookbooks then custom
               end
        File.join(root, name)
      end

    end
  end
end
